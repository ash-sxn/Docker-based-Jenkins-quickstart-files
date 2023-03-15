pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/ash-sxn/Docker-based-Jenkins-quickstart-files.git', branch: 'main')
      }
    }

    stage('Build and run containers') {
      steps {
        sh 'docker compose up -d'
      }
    }

    stage('Check containers') {
      steps {
        sh 'docker ps | grep jenkins-blueocean'
        sh 'docker ps | grep jenkins-docker'
      }
    }

  }
  post {
    always {
      sh 'docker compose down'
    }

  }
}
