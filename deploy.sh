#!/bin/bash

echo "Building Jekyll site..."

# Exit on error
set -e

# Build the site
bundle exec jekyll build

echo "Deploying Jekyll site..."

# Navigate into _site
cd _site

# Add and commit the built site
git add .
commit_msg="Deploy site: $(date +'%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_msg" || echo "Nothing to commit."

# Force push to gh-pages branch
git push --force origin gh-pages

# Go back to project root
cd ..

echo "Deployed to gh-pages and returned to project root."