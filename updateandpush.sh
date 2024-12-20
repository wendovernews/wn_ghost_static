#!/bin/bash

# Change to the directory containing your static site
cd $HOME/repos/github/wendovernews/wn_ghost_static

# Get latest from GitHub
git checkout main
git pull

# Build the static site (replace with your actual build command)
gssg --url http://localhost:2368 --dest ./docs

# Stage and commit changes
git add docs
git commit -m "Regenerate static site"

# Push to GitHub
git push origin main

echo "Finished"