pipeline {
    agent {
        label '!windows'
    }

    environment {
        DISABLE_AUTH = 'Vinay'
        DB_ENGINE    = 'Kadalagi'
    }

    stages {
        stage('Build') {
            steps {
                echo "Database engine is ${DB_ENGINE}"
                echo "DISABLE_AUTH is ${DISABLE_AUTH}"
                sh 'printenv'
            }
        }
    }
}
