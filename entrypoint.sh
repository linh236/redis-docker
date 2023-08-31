#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /web_game/tmp/pids/server.pid

bin/rails tailwindcss:watch

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

# if ! command -v foreman &> /dev/null
# then
#   echo “Installing foreman…”
#   gem install foreman
# fi

# foreman start -f Procfile.dev “$@“