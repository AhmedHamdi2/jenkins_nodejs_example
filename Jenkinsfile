pipeline {
    agent {
        docker {
            image 'node:18' 
            args '-v /var/run/docker.sock:/var/run/docker.sock'  
        }
    }

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds')  
        DOCKERHUB_USERNAME = 'ahmedhamdi1' 
        IMAGE_NAME = 'jenkins-nodejs-example'  
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
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker push $DOCKERHUB_USERNAME/$IMAGE_NAME
                    """
                }
            }
        }
    }
}
