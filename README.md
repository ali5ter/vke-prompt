# vke-prompt
[vke_bash_prompt.sh](vke_bash_prompt.sh) adds a Vmware Cloud PKS (formerly VKE) prompt to your `PS1`.
Source this script from your `.bash_profile` and, in a new shell, enter
`vke_prompt on` to display the Cloud PKS prompt. Remove the Cloud PKS prompt by entering
`vke_prompt off`.

![screencast demo of the vke prompt](https://raw.githubusercontent.com/ali5ter/vke-prompt/master/vke_prompt.gif)

## Using with kube-ps1
You can hide the K8s current context in this prompt using
`export VKE_PROMPT_CONTEXT_ENABLED='off'`. Useful if you're already using
something like [kube-ps1](https://github.com/jonmosco/kube-ps1).

## Pre-requisites
[jq](https://stedolan.github.io/jq/download/) is used to parse JSON responses from the Cloud PKS CLI.

## Other Cloud PKS utilities
You may have use for some other Cloud PKS projects:
* [Install Cloud PKS CLI using homebrew](https://github.com/ali5ter/homebrew-vke-cli)
* [Cloud PKS CLI bash or zsh completion](https://github.com/ali5ter/vke-completion)
* [Scripts used with Cloud PKS](https://github.com/ali5ter/vmware_scripts/tree/master/vke)
* [Extended Cloud PKS CLI functionality](https://github.com/ali5ter/vke-cli-extended)
