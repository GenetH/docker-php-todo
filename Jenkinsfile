pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'genih/php-todo-app'
    
    }

     stages {
        stage("Initial cleanup") {
            steps {
                dir("${WORKSPACE}") {
                    deleteDir()
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_HUB_REPO}:${env.BRANCH_NAME}${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    sh "docker push ${DOCKER_HUB_REPO}:${env.BRANCH_NAME}${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
