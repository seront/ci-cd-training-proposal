pipeline {
       environment {
    registry = "seront/node-test"
    registryCredential = 'dockerhub-seront'
    registryHerokuCredential = 'heroku-seront'
    dockerImage = ''
}
    agent any
     tools {
    nodejs 'node1'
  }
   
  stages {
    stage('Startup') {
      steps {
        script {
          sh 'npm install'
        }
      }
    }
    // stage('Dependencies test') {
    //   steps {
    //     script {
    //       sh 'npm install -g snyk'
    //       sh 'snyk auth 6b788178-c98c-4491-bddf-63f278bdb9c4'
    //       sh 'snyk test'
    //     }
    //   }
    // }
    stage('Test') {
      steps {
        script {
          sh 'npm run test'
        }
      }
      post {
        always {
          step([$class: 'CoberturaPublisher', coberturaReportFile: 'output/coverage/jest/cobertura-coverage.xml'])
        }
      }
    }
    stage('Building image') {
      // when {
      //   branch 'develop'
      // }
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Develop') {
      // when {
      //   branch 'develop'
      // }
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    
    stage('Deploy in production'){
      // when {
      //   branch 'master'
      // }
      steps{
        sh 'echo Hacer el despliegue en produccion'
        // sh 'docker login --username=seront.nmmc@gmail.com --password=$(heroku auth:token) registry.heroku.com'
        // sh "docker push $registry:$BUILD_NUMBER"
        script {
          docker.withRegistry( 'registry.heroku.com', registryHerokuCredential ) {
            dockerImage.push('registry.heroku.com/seront-node-test-1/image')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      when {
        branch 'develop'
      }
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
}
    
}