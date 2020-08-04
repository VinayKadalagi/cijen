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
    image: registry.gitlab.com/vinaykadalagi1/cijen/customdind
    command:
    - cat
    tty: true
    volumeMounts:
    - name: dockersock
      mountPath: /var/run/docker.sock
<<<<<<< HEAD
    - name: dockerconfig
      mountPath: /etc/docker
=======
    - name: daemon
      mountPath: /etc/docker/daemon.json
>>>>>>> 02aef0b7d241b92669acded4d8b3c3824d7386ba
  volumes:
  - name: dockersock
    hostPath:
      path: /var/run/docker.sock
<<<<<<< HEAD
  - name: dockerconfig
    hostpath:
      path: /etc/docker
=======
  - name: daemon
    hostPath:
      path: /etc/docker/daemon.json
>>>>>>> 02aef0b7d241b92669acded4d8b3c3824d7386ba
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