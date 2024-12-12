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