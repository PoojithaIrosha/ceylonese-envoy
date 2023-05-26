pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dir('ceylonese-envoy') {
                    withMaven(maven: 'Maven') {
                        sh 'mvn clean package'
                    }
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
