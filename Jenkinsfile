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

    stage('Push'){
        docker.withRegistry(registry, 'registry', '74734589924') {
            docker.image(imageName).push(commitID())

            if (env.BRANCH_NAME == 'master') {
                docker.image(imageName).push('master')
            }
        }
    }
}

def commitID() {
    sh 'git rev-parse HEAD > .git/commitID'
    def commitID = readFile('.git/commitID').trim()
    sh 'rm .git/commitID'
    commitID
}
