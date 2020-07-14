pipeline {
    agent any
    environment { 
        GOCACHE = '/tmp/gocache'
        VERSION_MAJOR = '0'
        VERSION_MINOR = '1'
        BUILD_NUMBER_BASE = '8'
        VERSION_PATCH = """${sh(
            returnStdout: true,
            script: 'echo "$(( ${env.BUILD_NUMBER} - $BUILD_NUMBER_BASE ))"'
        )}""" 
        TAG = "${VERSION_MAJOR}.${VERSION_MINOR}.${env.VERSION_PATCH}"
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
