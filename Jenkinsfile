pipeline {
    agent any
    environment {
        BUILD_NUMBER_BASE = '0'
        GOCACHE = '/tmp/gocache'
        VERSION_MAJOR = '0'
        VERSION_MINOR = '1'
        VERSION_PATCH = "${env.BUILD_NUMBER.toInteger() - BUILD_NUMBER_BASE.toInteger()}"
    }
    stages {
        stage('deploy') {
            agent any
            steps {
                echo "${env.BRANCH_NAME}"
            }
        }
    }
}
