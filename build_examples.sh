# run the tools/make_model_formats.py script on the _static/models directory
python tools/make_model_formats.py _static/models

# for each filename in the examples/ directory, look for a corresponding .ttl file in the 
# _static/models directory. If it exists, run the tools/make_count_table.py script as
# python tools/make_count_table.py _static/models/<filename>.ttl > examples/<filename>.md
for filename in examples/*.md; do
    if [ -f "${filename%.md}.ttl" ]; then
        python tools/make_count_table.py "${filename%.md}.ttl" > "$filename"
    fi
done
