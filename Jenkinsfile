pipeline {
    agent {
        label '!windows'
    }

    environment {
        FAS = "BIOS,SITE MGMT,LEAD,COLO"
    }

    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    def customImage = docker.build('registry.gitlab.com/vinaykadalagi1/cijen/custom-image', '--build-arg FAS=${FAS}')
                    docker.withRegistry('https://registry.gitlab.com/', 'gitlab-registry'){
                        customImage.push()
                    }
                }
            }
        }
    }
}
