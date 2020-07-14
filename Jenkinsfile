pipeline {
    agent any
    environment {
        BUILD_NUMBER_BASE = '10'
        VERSION_MINOR = '1'
        VERSION_MAJOR = '0'
        VERSION_PATCH = "${env.BUILD_NUMBER.toInteger() - BUILD_NUMBER_BASE.toInteger()}"
    }
    stages {
        stage('deploy') {
            agent any
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
