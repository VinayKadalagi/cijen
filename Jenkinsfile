List<String> CHOICES = [];
pipeline {
    agent {
        label '!windows'
    }

    environment {
        FAS = "BIOS,SITEMGMT"
    }

    stages {
        stage('User Input') {


            steps {
                script {
                        CHOICES = ["tag1", "tag2", "tag3"];    
                        env.YourTag = input  message: 'What are we deploying today?',ok : 'Deploy',id :'tag_id',
                        parameters:[choice(choices: CHOICES, description: 'Select a tag for this build', name: 'TAG')]
                        }           
                echo "Deploying ${env.YourTag}. Have a nice day."
            }
        }

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
