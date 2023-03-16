pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/ash-sxn/Docker-based-Jenkins-quickstart-files.git', branch: 'main')
      }
    }

    stage('Up') {
      steps {
        sh 'docker compose up -d'
      }
    }

    stage('check') {
      steps {
        sh '''if  docker ps | grep jenkins-docker; then
    echo "jenkins-docker container running"
else
    exit 1
fi
if  docker ps | grep jenkins-blueocean; then
    echo "jenkins-blueocean container running"
else
    exit 1
fi'''
      }
    }

    stage('Down') {
      steps {
        sh 'docker compose down'
      }
    }

  }
}