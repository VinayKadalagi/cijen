List<String> CHOICES = [];
pipeline {
    agent {
        label '!windows'
    }

    parameters {
        choice( 
            name: 'FAS', 
            choices: "stage1/nstage2", 
            description: 'Sélectionnez le projet à construire.'
        )
    
    
    }

    environment {
        FAS = "BIOS,SITEMGMT"
    }

    stages {

        stage('Build Docker Images') {

            steps {
                script {
                    echo "Hello ${params.FAS}"
                    def customImage = docker.build("registry.gitlab.com/b_ram/jenkins_test/custom-image", "--build-arg FAS=${FAS} .")
                    docker.withRegistry('https://registry.gitlab.com/', 'test_gitlab'){
                        customImage.push()
                    }
                }
            }
        }
    }
}
