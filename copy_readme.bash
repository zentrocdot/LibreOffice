#!/usr/bin/bash
# You use the script at your own risk.

# Define the languages.
# qtz is mandatory.
lang_array=("qtz" "de" "it" "fr")

# Set the user name.
user="<local-user>"

# Define the reference file name.
ref_fn="README_en-US"

# Set the array with the directories.
dir_array=("/home/${user}/libreoffice/instdir/readmes"
           "/home/${user}/libreoffice/workdir/CustomTarget/readlicense_oo/readme")

# Loop over the directories.
for dir in "${dir_array[@]}"
do
    # Loop over the languages.
    for lang in "${lang_array[@]}"
    do
        # Copy reference file to new file.
        cp "${dir}/${ref_fn}" "${dir}/README_${lang}"
    done
done

# Exit script.
exit 0
