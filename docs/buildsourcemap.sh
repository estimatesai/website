#!/bin/bash

# destination folder in which the build result will be stored
DEST="./_site/assets/css"

# folder in which original SCSS files will be placed
ORIGINALS=$DEST/originals

# folder in which include SCSS file will be places
INCLUDES=$ORIGINALS/_sass

# remove the previous version of the folder
rm -r $ORIGINALS
mkdir $ORIGINALS

# copy original SASS include files to output folder
cp -r ./_sass/ $ORIGINALS

# name of the entry point SCSS file (without the extension)
SASS_FILE=main

# copying the entry point SCSS file to the output folder
# (removing the frontmatter from the file)
tail -n +4 ./assets/css/$SASS_FILE.scss > $ORIGINALS/$SASS_FILE.scss

# building the entry SCSS file
sass --load-path $INCLUDES --sourcemap=auto $ORIGINALS/$SASS_FILE.scss $DEST/$SASS_FILE.css
