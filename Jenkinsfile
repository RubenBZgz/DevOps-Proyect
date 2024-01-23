 /*     FALTA
Hay que hacer un trigger para el pull request. https://devopscube.com/jenkins-build-trigger-github-pull-request/

Multirepository
Stage final con el terraform apply
Mirar lo de cómo linkear azure apps con la website
*/
pipeline {
    agent any
    
    environment {
        PROYECT_NAME = 'DevOps-Proyect'
        // Pending creation of credentials
        GITHUB_TOKEN = ''
        PIPELINE_RESULT = 'OK'
    }

    stages {
        stage('Initial Set up') {
            steps {
                echo "Starting Initial Set up stage"
                script {
                    // Delete the entire workspace before starting
                    deleteDir()

                    // Initializing Workspace environment
                    git branch: 'dev',url: 'https://github.com/SokeOn/DevOps-Proyect.git'

                    // Getting all credentials
                    TF_VAR_azure_subscription_id = credentials('TF_VAR_azure_subscription_id')
                    TF_VAR_azure_tenant_id = credentials('TF_VAR_azure_tenant_id')
                    TF_VAR_azure_client_id = credentials('TF_VAR_azure_client_id')
                    TF_VAR_azure_client_secret = credentials('TF_VAR_azure_client_secret')

                    // Creation of encrypted azure credentials file 
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
                    ${env.PIPELINE_RESULT} = 'ERROR'
                }
            }
        }
        stage ('Docker') {
            steps{
                echo "Starting Docker Stage"
                script {
                    /*
                    img = 'docker/compose'
                    echo "Pull"
                    docker.image(img).pull()
                    echo "Run commands $WORKSPACE"*/
                    
                    // Creation of containers using docker-compose in the console
                    if (isUnix()) {
                        echo 'Linux'
                        sh 'ls -al'
                        sh "docker-compose create"
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
                    ${env.PIPELINE_RESULT} = 'ERROR'
                }
            }
        } 
        stage ("Testing") {
            steps {
                echo "Starting Testing stage"
                script {
                    // Running unit-tests docker-compose service
                    bat "docker-compose up unit-tests"

                    // Getting unit-tests result
                    def script = 'docker-compose logs unit-tests | findstr "example"'

                    def logsOutput

                    // Execute the command and capture the output
                    bat(script: script, returnStatus: false, stdout: logsOutput)

                    // Print the captured output
                    echo "Logs output: ${logsOutput}"
                }
            }
            post{
                failure{
                    echo "Error in Testing stage"
                    ${env.PIPELINE_RESULT} = 'ERROR'
                }
            }
        }
        stage ('Terraform') {
            steps {
                script {
                    bat "docker-compose run terraform plan"
                    // Getting result of terraform plan
                    def result = ''

                    
                    if(result = 'ERROR'){
                        // Terraform apply later
                        ${env.PIPELINE_RESULT} = 'ERROR'
                    }
                }
            }
            post{
                failure{
                    echo "Error in Terraform stage"
                    ${env.PIPELINE_RESULT} = 'ERROR'
                }
            }
        }
        stage ('Final') {
            steps {
                script {
                    echo "Pipeline terminada"
                    bat "docker-compose stop"
                    //bat "docker-compose down"
                }
            }
        }
        
    }
    /*  In case of any stage fails, reverts GitHub main branch to the previous commit. 
        It's a good practice having production environment only with working code.

        Habría que mirar cómo hacerlo con multibranch, consiguiendo el nombre de la branch que ha hecho el pull request 
        y aplicando el revert a dicha branch.
        */
    post {
        success {
            echo "PIPELINE SUCCESS"
            // bat "docker-compose run terraform plan"
            if(${env.PIPELINE_RESULT = 'OK'}){
                echo ("Applying terraform plan")
                // bat "docker-compose run terraform plan"
            } else {
                echo "Pipeline failed. Reverting the pull request"
                //def commit_hask = git log -1
                //git revert -m 1 <commit-hash> --no-edit
                //git push https://<your-username>:${env.GITHUB_TOKEN}@github.com/<your-repo>.git <branch-name>
            }
        }
        failure {
            script {
                echo "Pipeline failed. Reverting the pull request"
                //def commit_hask = git log -1
                //git revert -m 1 <commit-hash> --no-edit
                //git push https://<your-username>:${env.GITHUB_TOKEN}@github.com/<your-repo>.git <branch-name>
                }
            }
    }
}


