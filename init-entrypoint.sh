#!/bin/sh
set -eu

# Parse insecure registries from environment variable
parse_insecure_registries() {
    local registries="${DOCKER_INSECURE_REGISTRIES:-}"
    local result=""
    
    if [ -n "$registries" ]; then
        # Split by comma, space, or semicolon
        for registry in $(echo "$registries" | tr ',;' ' '); do
            result="$result --insecure-registry $registry"
        done
    fi
    
    echo "$result"
}

# Check if we're calling dockerd (directly or indirectly)
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ] || [ "$1" = "dockerd" ]; then
    # Export our extra options so they can be picked up by a subshell
    export DOCKERD_EXTRA_OPTS="$(parse_insecure_registries) ${DOCKER_EXTRA_OPTS:-}"
    
    # Modify PATH to include our scripts directory
    export PATH="/usr/local/bin/custom-scripts:$PATH"
fi

# Call the original entrypoint script
exec /usr/local/bin/dockerd-entrypoint.sh "$@"
