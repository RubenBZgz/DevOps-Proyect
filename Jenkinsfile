pipeline{
    agent any
    tools {
        maven 'MAVEN'
    }
    stages {
        stage('Build Maven') {
            steps{
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: 'd362e9c1-3228-4ac0-b10f-beb19e08f740', url: 'https://github.com/SokeOn/DevOps-Proyect']])
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    }
}