#!/usr/bin/env bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Ask for commit message
echo "Enter commit message:"
read commit_message

# Check if the user entered a commit message
if [ -z "$commit_message" ]; then
    echo -e "${RED}Error: Commit message cannot be empty.${NC}"
    exit 1
fi

# Add changes to git
if ! git add .; then
    echo -e "${RED}Error: Failed to stage changes.${NC}"
    exit 1
fi

# Commit changes
if ! git commit -m "$commit_message"; then
    echo -e "${RED}Error: Commit failed.${NC}"
    exit 1
fi

# Push to gh-pages branch
git branch -D gh-pages 2>/dev/null
if git subtree split --prefix=dist -b gh-pages; then
    if git push -f origin gh-pages; then
        echo -e "${GREEN}Deployment successful!${NC}"
        git checkout main
        git branch -D gh-pages
    else
        echo -e "${RED}Deployment failed!${NC}"
        exit 1
    fi
else
    echo -e "${RED}Failed to create gh-pages branch.${NC}"
    exit 1
fi
