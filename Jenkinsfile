def label = "docker-jenkins-${UUID.randomUUID().toString()}"

podTemplate(label: label,
        containers: [
                containerTemplate(name: 'jnlp', image: 'gcc:9.3.0'),
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
                    sh "docker --version"                
                }
        }
    }
}