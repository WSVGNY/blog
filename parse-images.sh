#!/bin/bash

# This scrit was generated with ChatGPT-4o

# Delete the existing posts directory
rm -rf content/posts

# Ensure the required directories exist
mkdir -p content/posts

# Get the list of JPG and JPEG files from the source directory
source_dir="_local/source"
pictures=("$source_dir"/*.JPG)

# Set the number of pictures per group
group_size=10

# Calculate the total number of pictures and the number of leftover pictures
total_pictures=${#pictures[@]}
leftover_pictures=$((total_pictures % group_size))
full_groups=$((total_pictures / group_size))

echo $total_pictures

# Initialize the counter for folder names and dates in descending order
total_groups=$((full_groups + (leftover_pictures > 0 ? 1 : 0)))
folder_counter=1
date_counter=1

# Handle the first group with the leftover pictures if any
if (( leftover_pictures > 0 )); then
    # Generate the folder name for the first group
    folder_name=$(printf "%04d" $folder_counter)
    
    # Create the folder structure under the posts directory
    images_dir="content/posts/$folder_name/images"
    mkdir -p "$images_dir"

    # Copy the leftover pictures to the images directory
    for ((j=0; j<leftover_pictures; j++)); do
        cp "${pictures[j]}" "$images_dir"
    done

    # Create the index.md file for the first group
    markdown_file="content/posts/$folder_name/index.md"
    cat <<EOL > "$markdown_file"
---
title: "$folder_name"
date: 2024-01-$(printf "%02d" $date_counter)
draft: false
---

{{< picture-list "images/*">}}
EOL

    # Increment the counters and adjust the pictures array
    ((folder_counter++))
    ((date_counter++))
    pictures=("${pictures[@]:leftover_pictures}")
fi

# Iterate over the remaining pictures in groups of 3
for ((i=0; i<${#pictures[@]}; i+=group_size)); do
    # Generate the folder name using the counter
    folder_name=$(printf "%04d" $folder_counter)
    
    # Create the folder structure under the posts directory
    images_dir="content/posts/$folder_name/images"
    mkdir -p "$images_dir"

    # Copy the group of pictures to the images directory
    for ((j=i; j<i+group_size && j<${#pictures[@]}; j++)); do
        cp "${pictures[j]}" "$images_dir"
    done

    # Create the index.md file with the specified content
    markdown_file="content/posts/$folder_name/index.md"
    cat <<EOL > "$markdown_file"
---
title: "$folder_name"
date: 2024-01-$(printf "%02d" $date_counter)
draft: false
---

{{< picture-list "images/*">}}
EOL

    # Increment the counters
    ((folder_counter++))
    ((date_counter++))
done

echo "Pictures have been organized into 'content/posts' directory with markdown files."
