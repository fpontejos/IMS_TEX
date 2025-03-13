#!/bin/bash
# Define output directory
outdir="pdf"

# Create the output directory if it doesn't exist
mkdir -p $outdir

# List of filenames to process (without .tex extension)
filenames=(
    "MDSAA_EN_Cover"
    "MDSAA_PT_Cover"
    "MDDM_EN_Cover"
    "MDDM_PT_Cover"
    "MEGI_EN_Cover"
    "MEGI_PT_Cover"
    "MGI_EN_Cover"
    "MGI_PT_Cover"
)

# Process each filename
for filename in "${filenames[@]}"; do
    echo "Processing $filename..."
    
    # Run latexmk to compile the document
    latexmk -lualatex -outdir=$outdir --jobname=$filename "$filename.tex" && \
    
    # Clean up auxiliary files
    latexmk -lualatex -c -outdir=$outdir --jobname=$filename "$filename.tex"
    
    # Check if compilation was successful
    if [ $? -eq 0 ]; then
        echo "Successfully processed $filename"
    else
        echo "Error processing $filename"
    fi
done

echo "All files processed."