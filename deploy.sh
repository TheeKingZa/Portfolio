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

# Commit changes to master
if ! git commit -m "$commit_message"; then
    echo -e "${RED}Error: Commit failed.${NC}"
    exit 1
fi

# Push to master branch
if ! git push origin master; then
    echo -e "${RED}Error: Failed to push changes to master.${NC}"
    exit 1
fi

# Create or switch to gh-pages branch
if ! git checkout gh-pages; then
    echo -e "${GREEN}Switching to gh-pages branch...${NC}"
    git checkout -b gh-pages
fi

# Merge master into gh-pages
if ! git merge master; then
    echo -e "${RED}Merge failed! Resolve conflicts and try again.${NC}"
    exit 1
fi

# Push to gh-pages branch
if ! git push -f origin gh-pages; then
    echo -e "${RED}Error: Deployment to gh-pages failed.${NC}"
    exit 1
fi

# Switch back to master
git checkout master

# Check if there were any errors
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfully deployed to gh-pages and switched back to master!${NC}"
else
    echo -e "${RED}Error occurred while switching back to master.${NC}"
    exit 1
fi
