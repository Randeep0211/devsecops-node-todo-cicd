# Devsecops project details

# Prequisites
AWS t2large instance
Docker
Jenkins
SonarQube
docker compose
OWASP

# Installation

Clone the Repository.
https://github.com/Randeep0211/devsecops-node-todo-cicd.git

Make a Dockerfile.
Write the steps in the dockerfile to make a build of the project.

Find the Dockerfile in the repository with the name filename 'Dockerfile'.


# Groovy script for Jenkins pipeline

Refer Jenkinsfile in the repository.

Stage-1 
Clone the repo

Stage-2 
Make a build
docker build -t imagename:latest . 

Stage-3 
SonarQube Analysis

Stage-4 
SonarQube Quality Gate

Stage-5
OWASP Analysis to check vulnerabilities in the application prone to Cyber attacks.

Stage-6
Image scanning by Trivy.

Stage-7
Push the container of the app to DockerHub.




