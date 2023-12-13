# run the tools/make_model_formats.py script on the _static/models directory
python tools/make_model_formats.py _static/models

# for each filename in the examples/ directory, look for a corresponding .ttl file in the 
# _static/models directory. If it exists, run the tools/make_count_table.py script as
# python tools/make_count_table.py _static/models/<filename>.ttl > examples/<filename>.md
for filename in examples/*.md; do
    # check if the .ttl file exists in the _static/models directory, making
    # sure to get the basename of the filename (i.e. strip the directory)
    echo "Checking for .ttl file for $filename"
    # make the _static/models/<filename>.ttl filename
    ttl_filename="_static/models/$(basename "${filename%.md}.ttl")"
    if [ ! -f "$ttl_filename" ]; then
        echo "No .ttl file found for $filename"
        continue
    fi
    echo "Making count table for $filename"
    # make the examples/<filename>.md filename
    md_filename="examples/$(basename "${filename%.md}.md")"
    echo "Writing to $md_filename"

    python tools/make_count_table.py "$ttl_filename" "$md_filename"
done
