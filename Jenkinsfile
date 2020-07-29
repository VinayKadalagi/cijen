def label = "docker-jenkins-${UUID.randomUUID().toString()}"

podTemplate(label: label,
        containers: [
                containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave:alpine'),
                containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
            ],
            volumes: [
                hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
            ]
        ) {
    node(label) {
            stage('Docker Build') {
                container('docker') {   
                    echo "Building docker image..."
                    sh "ls"
                    sh "pwd"
                    sh "ls /home/jenkins/agent/workspace"
                    sh "docker build ."
                    sh "docker images"               
            }
        }
    }
}