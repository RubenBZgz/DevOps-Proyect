pipeline{
    agent any
    stages {
        stage('Checkout') {
            
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