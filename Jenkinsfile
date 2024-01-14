// Falta poner checkout al principio
pipeline{
    agent any
    stages {
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