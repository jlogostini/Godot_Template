#!/bin/bash

# Constants
BUILD_FOLDER="build"
IGNORE_FILES=(".gitkeep" ".gdignore")

# Check if the build folder exists
if [ -d "$BUILD_FOLDER" ]; then
    # Navigate to the build folder
    if ! cd "$BUILD_FOLDER"; then
        echo "Failed to navigate to $BUILD_FOLDER" >&2
        exit 1
    fi

    # Use find to search for files excluding .gitkeep and .gdignore
    find . -type f ! \( -name "${IGNORE_FILES[0]}" -o -name "${IGNORE_FILES[1]}" \) -print0 | while IFS= read -r -d '' file; do
        # Remove the file
        if ! rm -f "$file"; then
            echo "Failed to remove: $file" >&2
        else
            echo "Removed: $file"
        fi
    done

    echo "Cleanup completed!"
else
    echo "Build folder not found: $BUILD_FOLDER" >&2
    exit 1
fi