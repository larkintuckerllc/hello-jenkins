pipeline {
    agent none
    environment { 
        BUILD_NUMBER_BASE = '8'
    }
    stages {
        stage('deploy') {
            agent any
            environment {
                VERSION_PATCH = """${sh(
                    returnStdout: true,
                    script: 'echo "$(( ${env.BUILD_NUMBER} - $BUILD_NUMBER_BASE ))"'
                )}""" 
            }
            steps {
                echo $VERSION_PATCH
            }
        }
    }
}
