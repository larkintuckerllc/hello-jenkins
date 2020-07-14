pipeline {
    agent any
    environment {
        BUILD_NUMBER = "${env.BUILD_NUMBER}"
        BUILD_NUMBER_BASE = '3'
        VERSION_MINOR = '1'
        VERSION_MAJOR = '0'
    }
    stages {
        stage('deploy') {
            agent any
            environment {
                VERSION_PATCH = """${sh(
                    returnStdout: true,
                    script: 'echo -n "$(( $BUILD_NUMBER - $BUILD_NUMBER_BASE ))"'
                )}"""
            }
            steps {
                script {
                    docker.withRegistry('', 'docker-hub') {
                        def customImage = docker.build("sckmkny/hello-jenkins:$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH")
                        customImage.push()
                    }
                }
            }
        }
    }
}


