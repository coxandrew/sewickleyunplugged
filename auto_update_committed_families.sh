#!/bin/bash

# Set variables
SHEET_URL="https://docs.google.com/spreadsheets/d/1-8dfLXeE5hP2-KMeickluKh7Pf7gHPi-Eg2idPa3l8s/pub?output=csv"
DOWNLOAD_PATH="/Users/cox/projects/sewickleyunplugged/_data/families.csv"
REPO_PATH="/Users/cox/projects/sewickleyunplugged"

# Download the Google Sheet as a CSV
curl -L -o "$DOWNLOAD_PATH" "$SHEET_URL"

# Navigate to the git repository
cd "$REPO_PATH" || exit

# Add the file to the git index
git add "$DOWNLOAD_PATH"

# Create a new commit
git commit -m "Update families.csv with the latest data"

# Push the commit to the master branch
git push origin master
