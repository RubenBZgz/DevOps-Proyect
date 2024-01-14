pipeline{
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Automatically uses the default Git tool
                // checkout scm
                git 'https://github.com/SokeOn/DevOps-Proyect'
            }
        }
        stage('Build Maven') {
            steps{
                echo "====++++executing Buid Maven++++===="
                // sh "mvn -Dmaven.test.failure.ignore=true clean package"
                withMaven {
                    sh "mvn -Dmaven.test.failure.ignore=true clean package"
                }
            }
        }
    }
}