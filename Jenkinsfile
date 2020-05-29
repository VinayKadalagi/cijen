pipeline {
    agent {
        label '!windows'
    }

    environment {
        DISABLE_AUTH = 'Vinay'
        DB_ENGINE    = 'Kadalagi'
    }

    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    def customImage = docker.build('jenkins-image')
                    docker.withRegistry('https://registry.gitlab.com/', 'gitlab-registry'){
                        customImage.push()
                    }
                    echo "Database engine is ${DB_ENGINE}"
                    echo "DISABLE_AUTH is ${DISABLE_AUTH}"
                    sh 'printenv'
                }
            }
        }
    }
}
