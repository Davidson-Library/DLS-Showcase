#!/bin/bash
set -e

# Build the site
echo "Building site..."
bundle exec jekyll build

# Save current branch
CURRENT_BRANCH=$(git branch --show-current)

# Switch to gh-pages
git switch gh-pages

# Clean out old files (but preserve .git and .gitignore)
echo "Cleaning old files..."
find . -mindepth 1 -maxdepth 1 ! -name '.git' ! -name '.gitignore' ! -name 'CNAME' -exec rm -rf {} +

# Copy new site files
echo "Copying new build files..."
cp -a ../_site/. .

# Commit and push
git add .
commit_msg="Deploy site: $(date)"
git commit -m "$commit_msg" || echo "Nothing to commit."
git push origin gh-pages

# Switch back to original branch
git switch "$CURRENT_BRANCH"
echo "Deployed to gh-pages and returned to $CURRENT_BRANCH."