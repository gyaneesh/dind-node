#!/bin/sh
set -e

# If this looks like a dockerd command (either directly or via the entrypoint default behavior)
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ] || [ "$1" = "dockerd" ]; then
    # Pass control to original entrypoint, which will set up the dockerd command,
    # but use our extend-dockerd.sh as a wrapper around the final command
    UPSTREAM_DOCKER_ENTRYPOINT=/usr/local/bin/dockerd-entrypoint.sh
    
    # Execute the original entrypoint but with our wrapper in front of dockerd
    exec "$UPSTREAM_DOCKER_ENTRYPOINT" /usr/local/bin/extend-dockerd.sh "$@"
else
    # For non-dockerd commands, just pass through to the original entrypoint
    exec /usr/local/bin/dockerd-entrypoint.sh "$@"
fi
