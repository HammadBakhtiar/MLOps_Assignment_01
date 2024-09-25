pipeline {
    environment {
        imagename = "hammadbakhtiar/my_image"
        dockerImage = ''
        containerName = 'my-container'
        dockerHubCredentials = 'dockerhub-credentials'
    }
  
    agent any
 
    stages {
        stage('Cloning Git') {
            steps {
                git([url: 'git@github.com:HammadBakhtiar/MLOps_Assignment_01.git', branch: 'main'])
            }
        }
 
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build "${imagename}:latest"
                }
            }
        }
 
        stage('Running image') {
            steps {
                script {
                    bat "docker run -d --name ${containerName} ${imagename}:latest"
                }
            }
        }
 
        stage('Stop and Remove Container') {
            steps {
                script {
                    bat "docker stop ${containerName} || true"
                    bat "docker rm ${containerName} || true"
                }
            }
        }
 
        stage('Deploy Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"

                        bat "docker push ${imagename}:latest"
                    }
                }
            }
        }
    }
}