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
    image: docker
    command:
    - cat
    tty: true
    volumeMounts:
    - name: dockersock
      mountPath: /var/run/docker.sock
    - name: dockerconfig
      mountPath: /etc/docker
  volumes:
  - name: dockersock
    hostPath:
      path: /var/run/docker.sock
  - name: dockerconfig
    hostpath:
      path: /etc/docker
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
        container('docker') {
            sh 'echo ${adminPassword} | docker login --username ${adminUser} --password-stdin registry.gitlab.com'
            sh 'docker build --tag registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0 .'
            sh 'docker push registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0'
        }
        }
      }
    }
  }
}