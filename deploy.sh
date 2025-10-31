#!/bin/bash
URL="https://sys-nthu.github.io"

sh -c "cd ../lab-site ; HUGO_ENVIRONMENT=production hugo build --minify --baseURL $URL  --destination ../lab-site-deploy/docs"

echo "Staging changes..."
git add .

# Commit with timestamp
COMMIT_MSG="Deploy site on $(date '+%Y-%m-%d %H:%M:%S')"
echo "Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG" || echo "No changes to commit."

# Push to current branch
echo "Pushing to remote..."
git push origin master

echo "Deployment completed!"
