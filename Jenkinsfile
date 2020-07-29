pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: docker-box
spec:
  containers:
  - name: docker
    image: gcc:9.3.0
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    stage('AlpineAndBusybox') {
      steps {
        withCredentials([usernamePassword(
            credentialsId: "test_gitlab",
            usernameVariable: 'adminUser',
            passwordVariable: 'adminPassword'
          )]){
        container('gcc') {
            sh 'echo ${adminUser}'
            sh 'docker --version'
        }
        }
      }
    }
  }
}