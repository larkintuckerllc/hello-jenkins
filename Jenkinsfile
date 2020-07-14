pipeline {
    agent none
    environment { 
        GOCACHE = '/tmp/gocache'
        TAG = "0.1.${env.BUILD_NUMBER}"
    }
    stages {
        stage('build') {
            agent { docker { image 'golang:1.14' } }
            steps {
                sh 'go build'
            }
        }
        stage('test') {
            agent { docker { image 'golang:1.14' } }
            steps {
                sh 'go test ./...'
            }
        }
        stage('deploy') {
            agent any
            steps {
                script {
                    docker.withRegistry('', 'docker-hub') {
                        def customImage = docker.build("sckmkny/hello-jenkins:${TAG}")
                        customImage.push()
                    }
                }
            }
        }
    }
}
