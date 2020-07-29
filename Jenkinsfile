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
  - name: alpine
    image: alpine
    command:
    - cat
    tty: true
  - name: busybox
    image: busybox
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    stage('AlpineAndBusybox') {
      steps {
        container('alpine') {
          sh 'ls /var/jenkins/agent/workspace'
          sh 'pwd'
          sh 'tree /var/jenkins/agent/'
        }
        container('busybox') {
          sh 'ls /var/jenkins/agent/workspace'
          sh 'pwd'
          sh 'tree /var/jenkins/agent/'
        }
      }
    }
  }
}