# python
alias ptdebug='pytest -n0 -s'

# python
# Function to create directories and __init__.py files
export py_init() {
    if [ $# -eq 0 ]; then
        echo "Usage: py_init <path/to/directory>"
        return 1
    fi

    mkdir -p "$1" && find "$(dirname "$1")" -type d -exec sh -c '[ ! -e "$0/__init__.py" ] && touch "$0/__init__.py"' {} \;
}
