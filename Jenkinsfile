pipeline {
    agent none
    environment { 
        BUILD_NUMBER_BASE = '8'
    }
    stages {
        stage('deploy') {
            agent any
            environment {
                BUILD_NUMBER = '300'
                VERSION_PATCH = """${sh(
                    returnStdout: true,
                    script: 'echo "$(( $BUILD_NUMBER - $BUILD_NUMBER_BASE ))"'
                )}""" 
            }
            steps {
                echo $VERSION_PATCH
            }
        }
    }
}
