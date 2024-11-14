#!/bin/bash
# Create global .gitattributes
#TODO: Need a better way to update automatically if mergiraf updates

set -eu -o pipefail

readonly FILE="$HOME/.gitattributes"

readonly START_MARKER="### START GENERATED CONTENT"
readonly END_MARKER="### END GENERATED CONTENT"

CONTENT=$(mergiraf languages --gitattributes)
readonly CONTENT

if [ ! -f "$FILE" ] ; then
    printf "%s\n%s\n%s" "$START_MARKER" "$CONTENT" "$END_MARKER" >  "$FILE"
    exit 0
fi

# The content above has some weird characters that sed is unhappy with.
# Using awk to avoid figuring out how to escape things in the command output.
awk -i inplace \
    -v start_marker="$START_MARKER" \
    -v end_marker="$END_MARKER" \
    -v content="$CONTENT" '
    BEGIN {
        inside = 0
    }
    # Print lines until the start marker
    $0 ~ start_marker {
        print
        inside = 1
        print content
        next
    }
    # if inside the block, skip printing until the end marker
    inside && $0 ~ end_marker {
        print
        inside = 0
        next
    }
    # if inside the block, do not print lines, but if not, print normally
    !inside {print}
' "$FILE"
