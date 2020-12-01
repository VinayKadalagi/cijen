

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
            //sh 'curl -X POST "https://gitlab.com/api/v4/projects/19079864/merge_requests?source_branch=master&target_branch=feature1&title=test&target_project_id=19079864" --header "Authorization: Bearer Gpzv8Cn-AFFJitgYuSAX"'
            echo "done"
            //sh 'docker build --tag registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0 .'
            // sh 'docker push registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0
        
      }
      post {
                success {
                    updateGitlabCommitStatus name: STAGE_NAME, state: 'success'
                    script {
                      final String response = sh(script: 'curl -X POST "https://gitlab.com/api/v4/projects/19079864/merge_requests?source_branch=master&target_branch=feature1&title=test&target_project_id=19079864" --header "Authorization: Bearer Gpzv8Cn-AFFJitgYuSAX"', returnStdout: true).trim()
                      echo response
                    }
                }
                failure {
                    updateGitlabCommitStatus name: STAGE_NAME, state: 'failed'
                }
                aborted {
                    updateGitlabCommitStatus name: STAGE_NAME, state: 'canceled'
                }
            }
    }
  }
}