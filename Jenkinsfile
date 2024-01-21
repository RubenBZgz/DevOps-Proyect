// Falta poner checkout al principio
pipeline {
    agent any
    // agent {
    //     // docker { image 'docker/compose'}
    //     docker { image 'alpine'}
    // }
    
    environment {
        PROYECT_NAME = 'DevOps-Proyect'
        PROYECT_PATH = ''
    }

    stages {
        stage('Clean Workspace') {
            steps {
                script {
                    // Delete the entire workspace before starting
                    deleteDir()

                    git branch: 'dev',url: 'https://github.com/SokeOn/DevOps-Proyect.git'
                    def workspace = WORKSPACE
                    withEnv(["PROYECT_PATH=$WORKSPACE\\$PROYECT_NAME"]) {
                        echo "El PROYECT_PATH es igual a $PROYECT_PATH"
                    }
                }
            }
        }
        
        stage ('Docker') {
            steps{
                dir("${PROYECT_NAME}") {
                    echo "Estoy en el proyecto"
                    script {
                        img = 'alpine'
                        docker.image("${img}").run("-d -p 80:80")
                    }
                    
                }
            }
        }   
    }
}


