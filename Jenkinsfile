pipeline {
    agent { docker { image 'golang:1.14' } }
    stages {
        stage('build') {
            steps {
                sh 'go build'
            }
        }
        stage('test') {
            steps {
                sh 'go test'
            }
        }
    }
}
