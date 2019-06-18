pipeline {
       environment {
    registry = "seront/node-test"
    registryCredential = 'dockerhub-seront'
    registryHerokuCredential = 'heroku-seront'
    dockerImage = ''
    herokuImage = ''

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
    
    stage('Deploy in production (Heroku)'){
      // when {
      //   branch 'master'
      // }
      steps{
        // sh 'echo "$HEROKU_PASS" | docker login --username=seront.nmmc@gmail.com --password-stdin https://registry.heroku.com'
        // sh "docker push registry.heroku.com/seront-node-test-1/image"

        script {
          docker.withRegistry( 'https://registry.heroku.com', registryHerokuCredential ) {
            // dockerImage.push('registry.heroku.com/seront-node-test-1/image')
            herokuImage = docker.build + 'registry.heroku.com/seront-node-test-1/image'
            herokuImage.push()
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