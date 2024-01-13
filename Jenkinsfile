//jenkins.io/doc/book/pipeline/syntax/
pipeline{
    agent any
    stages{
        stage("Build our website"){
            steps{
                echo "====++++executing Build our website++++===="
                // sh "$PWD/scripts/build.sh"
                sh "jenkinsScripts/build.sh"
            }
            post{
                always{
                    echo "====++++always++++===="
                }
                success{
                    echo "====++++Build our website executed successfully++++===="
                }
                failure{
                    echo "====++++Build our website execution failed++++===="
                }
        
            }
        }
        stage("Run unit tests"){
            steps{
                echo "====++++executing Run unit tests++++===="
                sh "jenkinsScripts/unit_tests.sh"
            }
            post{
                always{
                    echo "====++++always++++===="
                }
                success{
                    echo "====++++Run unit tests executed successfully++++===="
                }
                failure{
                    echo "====++++Run unit tests execution failed++++===="
                }
        
            }
        }
        stage("Deploy website"){
            steps{
                echo "====++++executing Deploy website++++===="
                sh "jenkinsScripts/deploy_website.sh"
            }
            post{
                always{
                    echo "====++++always++++===="
                }
                success{
                    echo "====++++Deploy website executed successfully++++===="
                }
                failure{
                    echo "====++++Deploy website execution failed++++===="
                }
        
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}