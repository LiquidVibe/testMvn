pipeline {
    agent any

    stages {
        stage ('Clean Stage') {

            steps {
                withMaven(maven : 'TestMaven') {
                    sh "mvn clean"
                }
            }
        }
        stage ('Packe Stage') {

            steps {
                withMaven(maven : 'TestMaven') {
                    sh "mvn package"
                }
            }
        }

    }


}