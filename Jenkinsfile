pipeline {
  agent any
  stages {
    stage('testcreds') {
      steps {
        withCredentials([usernamePassword(
            credentialsId: "project",
            usernameVariable: 'adminUser',
            passwordVariable: 'adminPassword'
          )]){

         sh  'echo "$adminUser"'
        }
      }
    }
  }
}
