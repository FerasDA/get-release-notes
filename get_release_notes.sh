#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <repo_path> <start_version> <end_version>"
    exit 1
fi

repo_path="$1"
start_version="$2"
end_version="$3"

output_file="release_notes.md"

cd "$repo_path" || { echo "Failed to change directory to $repo_path"; exit 1; }

release_notes=""

while read -r tag; do
    release_notes+="## Release notes for $tag\n"
    
    notes=$(gh release view "$tag" --json body --template '{{.body}}')
    
    release_notes+="$notes\n"
    release_notes+="\n---\n\n"
done < <(gh release list --limit 1000 | awk -v start="$start_version" -v end="$end_version" \
    '$1 >= start && $1 <= end { print $1 }')

echo -e "$release_notes" > "$output_file"

echo "Release notes have been written to $output_file in the $repo_path directory"
