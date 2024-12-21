#!/bin/bash

# Change to the directory containing your static site
cd $HOME/repos/github/wendovernews/wn_ghost_static

# Get latest from GitHub
git checkout main
git pull

# Build the static site (replace with your actual build command)
gssg --url http://localhost:2368 --dest ./docs

# Replace absolute references to localhost to demo.wendovernews.org 
find "./docs" \( -name "*.html" -o -name "*.xml" -o -name "*.xsl" -o -name "*.txt" \) -exec sed -i '' 's|http://localhost:2368|https://demo.wendovernews.org|g' {} \;
find "./docs" \( -name "*.html" -o -name "*.xml" -o -name "*.xsl" -o -name "*.txt"\) -exec sed -i '' 's|localhost:2368|demo.wendovernews.org|g' {} \;

# Delete .DS_Store files
find . -name .DS_Store -print -delete

# Stage and commit changes
git add docs
git commit -m "Regenerate static site"

# Push to GitHub
git push origin main

echo "Finished"