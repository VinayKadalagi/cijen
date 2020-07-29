pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: gcc
    image: gcc:9.3.0
    command:
    - cat
    tty: true
  - name: docker
    image: docker
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    stage('AlpineAndBusybox') {
      steps {
        container('gcc') {
          sh 'pwd'
          
        }
        container('docker') {
          sh 'docker --version'  

        }
      }
    }
  }
}