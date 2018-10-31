node {
       stage ('SCM Checkout'){
            git credentialsId: '7d20cb95-f82d-49f2-853e-c628801c041a', url: 'https://github.com/LiquidVibe/testMvn.git'
       }

       stage ('Mvn Package') {
            def mvnHome = tool name: 'TestMaven', type: 'maven'
            def mvnCMD = "${mvnHome}/bin/mvn"
            sh "${mvnCMD} clean package"
       }

       stage ('Build Docker Image') {
            sh 'docker build -t bbentein/dockerMvnImage:1.0.0 .'
       }

       stage ('Push Docker Image'){
            withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                sh 'docker login -u bbentein -p ${dockerHubPwd}'
            }
            sh 'docker push bbentein/dockerMvnImage:1.0.0'
       }

}