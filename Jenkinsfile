pipeline {
    agent any

    tools {
        maven 'Maven-3.8.5'
    }

    stages {
        stage('Checkout & Build Maven') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/SamadhanMaske/devops-practice-1']]
                ])
                bat 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t ssmaske208/devops-practice-1 .'
            }
        }
        
        stage('Push Image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'devops-p-1', variable: 'dockerhub_pwd')]) {
                    bat '''
                        docker login -u ssmaske208 -p %dockerhub_pwd%
                        docker push ssmaske208/devops-practice-1
                    '''
                }
            }
        }
    }
}
