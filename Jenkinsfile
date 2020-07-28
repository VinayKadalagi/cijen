pipeline {
    agent {
    kubernetes {
      containerTemplate {
        name 'docker'
        image 'docker:1.11'
        ttyEnabled true
        command 'cat'
      }
    }
  }

    stages {
        stage('Build Docker Images') {
            steps {
                container('docker') {
                script {
                    def nicepass;
                    def user
                    withCredentials([usernamePassword(credentialsId: 'test_gitlab', usernameVariable : 'db_username', passwordVariable: 'creds')]) {
                        echo "in script"
                        nicepass = "${creds}"
                        user = "${db_username}"
                    }                    
                    echo nicepass
                    echo user
                    def excludeFAS =  "\"" + params['exclude Functional Areas'] + "\""
                    echo "Hello hey ${excludeFAS}"
                    def customImage = docker.build("registry.gitlab.com/vinaykadalagi1/cijen/custom-image:${env.GIT_COMMIT.substring(0,12)}", "--build-arg FAS=${excludeFAS} .")
                    docker.withRegistry('https://registry.gitlab.com/', 'gitlab-registry'){
                         customImage.push()
                        }
                    }
                }
            }
        }
    }
}