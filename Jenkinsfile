pipeline {
    agent any
    
    environment {
        PROYECT_NAME = 'DevOps-Proyect'
    }

    stages {
        stage('Initial Set up') {
            steps {
                echo "Starting Initial Set up stage"
                script {
                    // Delete the entire workspace before starting
                    deleteDir()

                    git branch: 'dev',url: 'https://github.com/SokeOn/DevOps-Proyect.git'

                    // Getting all credentials
                    TF_VAR_azure_subscription_id = credentials('TF_VAR_azure_subscription_id')
                    TF_VAR_azure_tenant_id = credentials('TF_VAR_azure_tenant_id')
                    TF_VAR_azure_client_id = credentials('TF_VAR_azure_client_id')
                    TF_VAR_azure_client_secret = credentials('TF_VAR_azure_client_secret')

                    //Creation of azure credentials file
                    echo "Credentials"
                    def fileContent = 
"""TF_VAR_azure_subscription_id=$TF_VAR_azure_subscription_id
TF_VAR_azure_tenant_id=$TF_VAR_azure_tenant_id
TF_VAR_azure_client_id=$TF_VAR_azure_client_id
TF_VAR_azure_client_secret=$TF_VAR_azure_client_secret"""

                    // Specify the file path and name
                    def filePath = "azure.env"

                    // Use the writeFile step to create the file
                    writeFile file: filePath, text: fileContent
                    echo "azure.env created"
                }
            }
            post{
                failure{
                    echo "Error in Initial Set Up stage"
                }
            }
        }
        stage ('Docker') {
            steps{
                echo "Starting Docker Stage"
                script {
                    img = 'docker/compose'
                    echo "Pull"
                    docker.image(img).pull()
                    echo "Run commands $WORKSPACE"
                    
                    
                    if (isUnix()) {
                        echo 'Linux'
                        sh 'ls -al'
                        // Copy files from the Jenkins workspace to the Docker container
                        sh "docker-compose up}"
                    } else {
                        echo 'Windows'
                        bat 'dir'
                        bat "docker-compose create"
                    }
                }
            }
            post{
                failure{
                    echo "Error in Docker stage"
                }
            }
        } 
        stage ("Testing") {
            steps {
                echo "Starting Testing stage"
                script {
                    bat "docker-compose up unit-tests"
                    def script = 'docker-compose logs unit-tests | findstr "example"'

                    def logsOutput

                    // Execute the command and capture the output
                    bat(script: script, returnStatus: false, stdout: logsOutput)

                    // Print the captured output
                    echo "Logs output: ${logsOutput}"
                }
            }
        }
        stage ('Final') {
            steps {
                script {
                    echo "Pipeline terminada"
                    bat "docker-compose stop"
                }
            }
        }
        post {
            failure {
                script {
                    echo "Revert"
                    echo "Pipeline failed. Reverting the pull request"
                    // Assuming you have a GitHub token with appropriate permissions
                    def githubToken = 'your-github-token'
                    def pullRequestId = env.CHANGE_ID

                    // Revert the pull request using Git/GitHub API
                    //sh "git checkout -b revert-${pullRequestId} master"
                    //sh "git revert -m 1 ${pullRequestId}"
                    //sh "git push origin revert-${pullRequestId}"

                    // Create a new pull request to merge the revert branch
                    //sh "curl -X POST -H 'Authorization: token ${githubToken}' -d '{\"base\":\"master\",\"head\":\"revert-${pullRequestId}\",\"title\":\"Revert PR ${pullRequestId}\"}' https://api.github.com/repos/your/repo/pulls"
                }
            }
        }
    }
}


