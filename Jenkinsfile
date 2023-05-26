pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                sshagent(['82500fc5-2515-4a08-a4be-79ea902443f4	']) {
                    sh 'git clone git@github.com:PoojithaIrosha/ceylonese-envoy.git'
                }
            }
         }

        stage('Build') {
            steps {
                dir('ceylonese-envoy') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}
