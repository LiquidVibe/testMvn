pipeline {
    agent any
    tools {
        jdk 'jdk8'
        maven 'maven3'
    }
  stages {
        stage('test java installation') {
            steps {
                sh 'java -version'
                sh 'which java'
            }
        }
        stage('test maven installation') {
            steps {
                sh 'mvn -version'
                sh 'which mvn'
            }
        }


        stage('Docker compose') {
          agent any
          steps {
            sh ‘docker-compose –f build-compose.yml run –rm compile’
            sh 'docker-compose -f ./docker-compose.yml build'
            sh 'docker-compose -f ./docker-compose.yml up --abort-on-container-exit'

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
            steps{
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                     sh 'docker login -u bbentein -p ${dockerHubPwd}'
                 }
                 sh 'docker push bbentein/dockerMvnImage:latest'
             }
         }
     }

    post {
        always {
            sh 'docker-compose -f ./docker-compose rm -f -s'
            sh 'docker-compose -f ./docker-compose.yml down --rmi local --remove-orphans'
        }
    }


}