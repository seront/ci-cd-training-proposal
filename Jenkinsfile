pipeline {
       environment {
    registry = "seront/node-test"
    registryCredential = 'dockerhub-seront'
    dockerImage = ''
}
    agent any
stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/seront/ci-cd-training-proposal.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
}
    
}