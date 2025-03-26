pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-microservice"
        IMAGE_TAG = "latest"
        DOCKER_REGISTRY = "my-docker-repo"
        K8S_NAMESPACE = "my-namespace"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/myrepo/microservice.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Push to Registry') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                    sh "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f k8s/deployment.yaml -n ${K8S_NAMESPACE}"
                sh "kubectl apply -f k8s/service.yaml -n ${K8S_NAMESPACE}"
            }
        }
    }
}
