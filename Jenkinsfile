pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'genih/php-todo-app'
        IMAGE_TAG = "php-todo:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/GenetH/docker-php-todo'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_HUB_REPO}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    sh "docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                }
            }
        }
    }
}
