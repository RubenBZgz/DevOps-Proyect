// Falta poner checkout al principio
pipeline {
    agent any
    stages {
        deleteDir()
        dir('dir-name') {
            stage('checkout') {
                git branch: 'dev',url: 'https://github.com/SokeOn/DevOps-Proyect.git'
            }
            stage('do stuff') {
                sh """
                    ls -al
                """
            }
        }
        stage("verify tooling") {
            steps {
                // sh '''
                // docker version
                // docker info
                // docker compose version 
                // curl --version
                // jq --version
                // '''
                sh 'docker version'
            }
        }
    }
}


