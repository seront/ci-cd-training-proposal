pipeline {
    agent any
    tools {nodejs "node1"} // Nombre de la instalacion de Jenkins
    stages{
        stage('Test'){
            steps{
                echo '---- Executing tests ------'
                sh 'npm i'
                sh 'npm run test'
            }
        }
    }
}