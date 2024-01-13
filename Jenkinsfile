//jenkins.io/doc/book/pipeline/syntax/
pipeline{
    agent any
    stages{
        stage("terraform"){
            steps{
                echo "====++++terraform init++++===="
                //sh 'docker-compose run --rm terraforn init'
            }
            post{
                always{
                    echo "====++++always++++===="
                }
                success{
                    echo "====++++terraform executed successfully++++===="
                }
                failure{
                    echo "====++++terraform execution failed++++===="
                }
        
            }
        }
        stage("Build our website"){
            steps{
                echo "====++++executing Build our website++++===="
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