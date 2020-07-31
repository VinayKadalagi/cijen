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
    image: docker:dind
    command:
    - cat
    tty: true
    volumeMounts:
    - name: dockersock
      mountPath: /var/run/docker.sock
  volumes:
  - name: dockersock
    hostPath:
      path: /var/run/docker.sock
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
            git 'https://github.com/VinayKadalagi/cijen/tree/develop/CustomImage'
            script {
            def image = docker.build 'cusdock'
            image.inside(){
              sh "docker info"
            }
            }
            //sh 'docker build --tag registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0 .'
            // sh 'docker push registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0'
        }
        }
      }
    }
  }
}