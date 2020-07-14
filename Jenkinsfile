pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    docker.withRegistry('', 'docker-hub') {
                        def customImage = docker.build('sckmkny/hello-jenkins:latest')
                        customImage.push()
                    }
                }
            }
        }
    }
}
