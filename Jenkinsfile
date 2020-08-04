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
  - name: dind
    image: registry.gitlab.com/vinaykadalagi1/cijen/customdind
    tty: true
    command:
    - 'cat'
    volumeMounts:
    - name: socket
      mountPath: /var/run/docker.sock
  
  - name: docker
    image: docker
    tty: true
    command:
    - 'cat'
    volumeMounts:
    - name: socket
      mountPath: /var/run/docker.sock
  volumes:
  - name: dockersock
    hostPath:
      path: /var/run/docker.sock
  - name: socket
    emptyDir: {}
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
        
        container('dind') {
            // script {
            // def image = docker.build("cusdock","CustomImage")
            // image.inside(){
            //   sh "docker info"
            // }
            // }
            sh 'docker info'
            //sh 'docker build --tag registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0 .'
            // sh 'docker push registry.gitlab.com/vinaykadalagi1/cijen/jenkube:1.0.0'
        }
        }
      }
    }
  }
}