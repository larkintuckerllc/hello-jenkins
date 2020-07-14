pipeline {
    agent any
    environment {
        BUILD_NUMBER = "${env.BUILD_NUMBER}"
    }
    stages {
        stage('deploy') {
            agent any
            steps {
                echo "${BUILD_NUMBER}"
            }
        }
    }
}


