pipeline{
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Automatically uses the default Git tool
                git 'https://github.com/SokeOn/DevOps-Proyect'
            }
        }
        stage('Build Maven') {
            steps{
                echo "====++++executing Buid Maven++++===="
                withMaven {
                    sh "mvn -Dmaven.test.failure.ignore=true clean package"
                }
            }
        }
    }
}