def imageName = 'mlabouardy/movies-loader'
def registry = 'https://hub.docker.com'

node{
    stage('Checkout'){
        checkout scm
    }

    stage('Unit Tests'){
        def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test .")
    }

    stage('Build'){
        docker.build(imageName)
    }

}

def commitID() {
    sh 'git rev-parse HEAD > .git/commitID'
    def commitID = readFile('.git/commitID').trim()
    sh 'rm .git/commitID'
    commitID
}
