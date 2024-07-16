pipeline{
    agent any 
    environment{
        SONAR_HOME = tool "Sonar"
    }
    stages{
        stage("Code Clone"){
            steps{
                git url:"https://github.com/Randeep0211/devsecops-node-todo-cicd.git", branch:"master"
                echo "Code clonned successfully"
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t devsecops-node-todo-cicd:latest ."
                echo "Build successful"
            }
        }
        stage("SonarQube Analysis"){
            steps{
                withSonarQubeEnv("Sonar"){
                    sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=nodo-todo -Dsonar.projectId=nodetodo -X"
                    echo "SonarQube Analysis completed"
                }
            }
        }
        // stage("SonarQube Gate"){
        //     steps{
        //         timeout(time:1,unit:"MINUTES"){
        //             waitForQualityGate abortPipeline:false
        //         }
        //     }
        // }
        stage("OWASP"){
            steps{
                dependencyCheck additionalArguments: "--scan ./", odcInstallation:"OWASP"
                dependencyCheckPublisher pattern:"**/dependency-check-report.xml"
            }
        }
        stage("Image scanning"){
            steps{
                sh "trivy image devsecops-node-todo-cicd:latest"
                echo "Image scanned successfully"
            }
        }
        stage("Deploy"){
            steps{
                withCredentials([usernamePassword(credentialsId:"DockerHubCreds", passwordVariable:"dockerPass", usernameVariable:"dockerUser")]){
                    sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                    sh "docker tag devsecops-node-todo-cicd:latest ${env.dockerUser}/devsecops-node-todo-cicd:latest"
                    sh "docker push ${env.dockerUser}/devsecops-node-todo-cicd:latest"
                    echo "Deployment Finished"
                }
            }
        }
    }
    
}
