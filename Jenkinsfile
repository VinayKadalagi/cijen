List<String> CHOICES = [];
pipeline {
    agent {
        label '!windows'
    }

    parameters {
        string( 
            name: 'exclude Functional Areas', 
            defaultValue: '',
            description: 'Please enter comma separated exclude Functional Area list'
        )
    }

    stages {

        stage('Build Docker Images') {

            steps {
                script {
                    def excludeFAS =  "\"" + params['exclude Functional Areas'] + "\""
                    echo "Hello hey ${excludeFAS}"
                    def customImage = docker.build("registry.gitlab.com/vinaykadalagi1/cijen/custom-image", "--build-arg FAS=${excludeFAS} .")
                    docker.withRegistry('https://registry.gitlab.com/', 'gitlab-registry'){
                        customImage.push()
                    }
                }
            }
        }
    }
}
