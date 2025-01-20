function VCS_INFO_detect_jj () {
        setopt localoptions NO_shwordsplit
        [[ $1 == '--flavours' ]] && return 1
        VCS_INFO_bydir_detect '.jj' || return 1
        return 0
}

function VCS_INFO_get_data_jj() {
    local jjactionstring jjchangeid jjbase jjlocalbookmarks jjempty jjdescription jjconflict jjmisc
    jjbase=${vcs_comm[basedir]}
    jjchangeid=$(jj log --no-graph -r @ -T 'change_id.shortest(8)')

    empty=$(jj log --no-graph -r @ -T 'self.empty()')
    [[ "$empty" = "true" ]] && jjempty="∅"

    description=$(jj log --no-graph -r @ -T 'self.description()')
    jjdescription="≢"
    [[ ! -z "$description" ]] && jjdescription="≡"

    conflict=$(jj log --no-graph -r @ -T 'self.conflict()')
    [[ "$conflict" = "true" ]] && jjconflict="↯"

    jjmisc=$(echo $jjempty $jjdescription $jjconflict)

    VCS_INFO_formats "$jjactionstring" "$jjchangeid" "$jjbase" "" "" "$jjchangeid" "$jjmisc"
}

alias jjalt="jj new @-"
alias jja="jj abandon"
alias jjbc="jj bookmark create"
alias jjbd="jj bookmark delete"
alias jjbl="jj bookmark list"
alias jjbm="jj bookmark move"
alias jjbp="jj git push -N -b"
alias jjd="jj describe"
alias jjdf="jj diff"
alias jjdm="jj describe -m"
alias jje="jj edit"
alias jjen="jj next --edit"
alias jjep="jj prev --edit"
alias jjf="jj git fetch"
alias jjl="jj log"
alias jjla="jj log -r ::"
alias jjn="jj new"
alias jjnn="jj next"
alias jjnp="jj prev"
alias jjol="jj op log"
alias jjp="jj git push -c"
alias jjrb="jj rebase -d"
alias jjs="jj show"
alias jjst="jj status"
alias jjsq="jj squash"
alias jju="jj undo"

#compdef jj
function _clap_dynamic_completer_jj() {
    local _CLAP_COMPLETE_INDEX=$(expr $CURRENT - 1)
    local _CLAP_IFS=$'\n'

    local completions=("${(@f)$( \
        _CLAP_IFS="$_CLAP_IFS" \
        _CLAP_COMPLETE_INDEX="$_CLAP_COMPLETE_INDEX" \
        COMPLETE="zsh" \
        jj -- ${words} 2>/dev/null \
    )}")

    if [[ -n $completions ]]; then
        _describe 'values' completions
    fi
}

compdef _clap_dynamic_completer_jj jj
