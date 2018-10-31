pipeline {
  agent none
  stages {

    stage('Docker compose') {
      agent any
      steps {
        sh 'docker-compose -f docker-compose.yml up'
      }
    }

    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t bbentein/dockerMvnRepo:latest .'
      }
    }
    stage ('Push Docker Image'){
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
             sh 'docker login -u bbentein -p ${dockerHubPwd}'
         }
         sh 'docker push bbentein/dockerMvnImage:latest'
     }
     }

    post {
        always {
            sh 'docker-compose -f docker-compose.yml down'
        }
    }


}