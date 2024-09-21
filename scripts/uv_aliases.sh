uv_helper() {
    if [[ $1 == "source" && -n $2 ]]; then
        source ~/.venv/$2/bin/activate
    else
        echo "Usage: uv source <project>"
    fi
}

#compdef uv
_uv() {
    local state

    _arguments \
        '1: :->command' \
        '2: :->project'

    case $state in
        command)
            _values 'command' 'source'
            ;;
        project)
            if [[ $words[2] == 'source' ]]; then
                local -a projects
                projects=(~/.venv/*(/:t))
                _describe 'project' projects
            fi
            ;;
    esac
}

compdef _uv uv_helper
