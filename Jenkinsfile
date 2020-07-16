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
                    withCredentials([usernameColonPassword(credentialsId: 'gitlab-registry', variable: 'creds')]) {
                        echo "in script"
                        echo "${creds}"
                        sh ' export fm = "$creds" '
                        sh 'echo $fm'
                        echo "$creds"
                        '''
                    }
                    // def excludeFAS =  "\"" + params['exclude Functional Areas'] + "\""
                    // echo "Hello hey ${excludeFAS}"
                    // def customImage = docker.build("registry.gitlab.com/vinaykadalagi1/cijen/custom-image:${env.GIT_COMMIT.substring(0,12)}", "--build-arg FAS=${excludeFAS} .")
                    // docker.withRegistry('https://registry.gitlab.com/', 'gitlab-registry'){
                    //      customImage.push()
                    // }
                }
            }
        }
    
    stage('Deploying to Machine') {
        steps {
             script {
                 sh "if [ ! -d deploy ] ; then mkdir deploy; fi"
                 sh """helm template --output-dir deploy --set tag=${env.GIT_COMMIT.substring(0,12)} mychart """
                 kubernetesDeploy(kubeconfigId: "akskube", configs: "deploy/mychart/templates/deployment.yaml")
             }
        }
    }
    }
}
