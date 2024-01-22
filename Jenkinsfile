pipeline {
    agent any
    
    environment {
        PROYECT_NAME = 'DevOps-Proyect'
    }

    stages {
        stage('Initial Set up') {
            steps {
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
        }
        stage ('Docker') {
            steps{
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
                        bat "docker-compose up"
                    }
                    echo "He terminado"
                }
            }
        }   
    }
}


