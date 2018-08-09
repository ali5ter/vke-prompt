#!/usr/bin/env bash
# @file vke_bash_prompt
# Add VKE prompt to $PS1...
# 1. Source this file from your .bash_profile 
# 2. In a new shell enter `vke_prompt on`
# Turn off by entering `vke_prompt off`
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

_vke_set_evars() {
    local colors=( BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE )
    for (( i=0; i<${#colors[@]}; i++ )); do
        export VKE_${colors[${i}]}="$(tput setaf ${i})"
        export VKE_B${colors[${i}]}="$(tput setab ${i})"
    done
    export VKE_BOLD="$(tput bold)"
    export VKE_RESET="$(tput sgr0)"
    export VKE_PROMPT=''
}

_vke_prompt_user() {
    \vke -o json account show | jq -r '.sub'
}

_vke_prompt_tenant() {
    jq -r '.Tenant.Name' ~/.vke-cli/vke-config | cut -c1-8
}

_vke_location() {
    local folder=$(jq -r '. | select(.Folder.Name != null) | .Folder.Name' ~/.vke-cli/vke-config)
    local project=$(jq -r '. | select(.GlobalProject.Name != null) | .GlobalProject.Name' ~/.vke-cli/vke-config)
    local cluster=''
    local location=''
    [[ -z ${folder} ]] || location+="📁 ${folder}"
    [[ -z ${project} ]] || {
        location+=" 〉🗄   ${project}"
        [[ "$VKE_PROMPT_CONTEXT_ENABLED" == 'on' ]] && {
            cluster=$(kubectl config current-context 2>/dev/null | sed 's/-context//' || echo '')
            [[ -z ${cluster} ]] || location+=" 〉📦 ${cluster}"
        }
    }
    echo "${location}"
}

_vke_bash_prompt() {
    [[ "$VKE_PROMPT_ENABLED" == 'on' ]] && {
        VKE_PROMPT="${VKE_WHITE}${VKE_BOLD}${VKE_BGREEN} VKE ${VKE_RESET}${VKE_WHITE}"
        VKE_PROMPT+="${VKE_BCYAN} Usr:$(_vke_prompt_user) Org:$(_vke_prompt_tenant) "
        VKE_PROMPT+="${VKE_BBLUE} $(_vke_location)  "
        VKE_PROMPT+="${VKE_RESET}"
        echo "${VKE_PROMPT}"
    }
}

export VKE_PROMPT_CONTEXT_ENABLED='on'
export VKE_PROMPT_ENABLED="off"
_vke_set_evars
PROMPT_COMMAND="_vke_bash_prompt; ${PROMPT_COMMAND:-}"

vke_prompt() { export VKE_PROMPT_ENABLED="$1"; }