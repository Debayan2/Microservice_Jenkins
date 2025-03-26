#!/bin/bash

# Set Git credentials (Optional if already configured)
GIT_USERNAME="your-username"
GIT_EMAIL="your-email@example.com"
REPO_URL="https://github.com/your-username/microservice.git"
BRANCH="main"

# Configure Git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

# Add changes to Git
git add .

# Commit changes with a timestamp
commit_message="Automated commit - $(date)"
git commit -m "$commit_message"

# Push to GitHub
git push origin "$BRANCH"

# Trigger Jenkins build (Optional - if webhook doesn’t work reliably)
JENKINS_URL="http://your-jenkins-server:8080"
JOB_NAME="your-job-name"
JENKINS_USER="your-jenkins-user"
JENKINS_API_TOKEN="your-api-token"

# Manually trigger Jenkins if needed
curl -X POST "$JENKINS_URL/job/$JOB_NAME/build" --user "$JENKINS_USER:$JENKINS_API_TOKEN"
