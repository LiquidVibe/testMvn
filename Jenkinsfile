pipeline {
    agent any

    stages {
        stage ('Package Stage') {

            steps {
                withMaven(maven : 'TestMaven') {
                    sh 'mvn clean package'
                }
            }
        }

    }


}