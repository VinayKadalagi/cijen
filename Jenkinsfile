pipeline {
  agent any
  stages {
    stage('Create MR') {
      steps {
            // script {
            // def image = docker.build("cusdock","CustomImage")
            // image.inside(){
            //   sh "docker info"
            // }
            // }
            sh 'curl -X POST "https://gitlab.com/api/v4/projects/19079864/merge_requests?source_branch=master&target_branch=feature1&title=test&target_project_id=19079864" --header "Authorization: Bearer Gpzv8Cn-AFFJitgYuSAX"'
            
            //sh 'docker build --tag registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0 .'
            // sh 'docker push registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0
        
      }
    }
  }
}