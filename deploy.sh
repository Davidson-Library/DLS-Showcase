#!/bin/bash
set -e

PROJECT_ROOT=$(pwd)
COMMIT_MSG=${1:-"Deploying site"}
TEMP_DIR=$(mktemp -d)

echo "🛠 Building site..."
bundle exec jekyll build

echo "📦 Saving built site temporarily..."
cp -a "$PROJECT_ROOT/_site/." "$TEMP_DIR/"

echo "🔀 Switching to gh-pages branch..."
git switch gh-pages

echo "🧹 Cleaning old files..."
find . -mindepth 1 -maxdepth 1 ! -name '.git' ! -name '.gitignore' ! -name 'CNAME' -exec rm -rf {} +

echo "📁 Copying new site files from temp..."
cp -a "$TEMP_DIR/." .

echo "📦 Committing changes..."
git add .
git commit -m "$COMMIT_MSG" || echo "Nothing to commit."

echo "🚀 Pushing to gh-pages..."
git push origin gh-pages

echo "🔁 Switching back to previous branch..."
git switch -

echo "✅ Deployed to gh-pages and returned to project root."

rm -rf "$TEMP_DIR"