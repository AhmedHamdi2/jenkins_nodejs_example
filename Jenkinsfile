pipeline {
    agent any

    environment {
        IMAGE_NAME = "ahmedhamdi1/nodejs-app" 
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AhmedHamdi2/jenkins_nodejs_example.git' 
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || true' 
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: 'dockerhub-creds', url: '' ]) {
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
    }
}
