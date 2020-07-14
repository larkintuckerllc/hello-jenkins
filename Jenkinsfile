pipeline {
    agent { docker { image 'golang:1.14' } }
    stages {
        stage('build') {
            steps {
                go build
            }
        }
        stage('test') {
            steps {
                go test
            }
        }
    }
}
