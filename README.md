# vke-prompt
[vke_bash_prompt.sh](vke_bash_prompt.sh) adds a VKE prompt to your `PS1`.
Source this script from your `.bash_profile` and, in a new shell, enter
`vke_prompt on` to display the VKE prompt. Remove the VKE prompt by entering
`vke_prompt off`.

![screencast demo of the vke prompt](https://raw.githubusercontent.com/ali5ter/vke-prompt/master/vke-prompt.gif)

## Using with kube-ps1
You can hide the K8s current context in this prompt using
`export VKE_PROMPT_CONTEXT_ENABLED='off'`. Useful if you're already using
something like [kube-ps1](https://github.com/jonmosco/kube-ps1).

## Other VKE utilities
You may have use for some other VKE projects:
* [Install VKE cli using homebrew](https://github.com/ali5ter/homebrew-vke-cli)
* [VKE cli bash or zsh completion](https://github.com/ali5ter/vke-completion)
* [Scripts used with VKE](https://github.com/ali5ter/vmware_scripts/tree/master/vke)
* [Extended VKE cli functionality](https://github.com/ali5ter/vke-prompt)
