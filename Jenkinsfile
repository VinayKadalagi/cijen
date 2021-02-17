pipeline {
  agent any
  stages {
    stage('testcreds') {
      steps {
        withCredentials([usernamePassword(
            credentialsId: "test",
            usernameVariable: 'adminUser',
            passwordVariable: 'adminPassword'
          )]){

         sh  'echo "$adminUser"'
        }
      }
    }
  }
}
