List<String> CHOICES = [];
pipeline {
    agent {
        label '!windows'
    }

    parameters {
        string( 
            name: 'FAS', 
            defaultValue: '',
            description: 'testing'
        )
    }

    environment {
        FAS = "BIOS,SITEMGMT"
    }

    stages {

        stage('Build Docker Images') {

            steps {
                script {
                    echo "Hello hey ${params.FAS}"
                    def customImage = docker.build("registry.gitlab.com/vinaykadalagi1/cijen/custom-image", "--build-arg FAS=${params.FAS} .")
                    docker.withRegistry('https://registry.gitlab.com/', 'test_gitlab'){
                        customImage.push()
                    }
                }
            }
        }
    }
}
