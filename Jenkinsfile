pipeline {
    agent{
        dockerfile true
    }
    stages {
        stage('SCM Checkout'){
            git credentialsId: '7d20cb95-f82d-49f2-853e-c628801c041a', url: 'https://github.com/LiquidVibe/testMvn.git'

            git(credentialsId: '7d20cb95-f82d-49f2-853e-c628801c041a', url: 'https://github.com/LiquidVibe/testMvn.git',branch:dev-branch)
        }

        stage ('Mvn Package') {
            def mvnHome = tool name: 'TestMaven', type: 'maven'
            def mvnCMD = "${mvnHome}/bin/mvn"
            sh "${mvnCMD} clean package"
        }

    }
}