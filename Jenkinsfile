pipeline {
    agent {
        label '!windows'
    }

    environment {
        FAS = "BIOS,SITEMGMT"
    }

    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    def customImage = docker.build("registry.gitlab.com/b_ram/jenkins_test/custom-image", "--build-arg FAS=${FAS} .")
                    docker.withRegistry('https://registry.gitlab.com/', 'test_gitlab'){
                        customImage.push()
                    }
                }
            }
        }
    }
}
