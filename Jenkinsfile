List<String> CHOICES = [];
pipeline {
    agent {
        label '!windows'
    }

    parameters {
        extendedChoice( 
            name: 'FAS', 
            defaultValue: '', 
            description: 'Sélectionnez le projet à construire.', 
            type: 'PT_SINGLE_SELECT', 
            groovyScript: valueKeysScript,
            descriptionGroovyScript: valueNamesScript
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
