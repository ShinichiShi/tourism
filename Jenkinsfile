pipeline {
  agent any

  options {
    timestamps()
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Basic validation') {
      steps {
        sh '''
          test -f index.html
          test -f style.css
          echo "Basic project files found."
        '''
      }
    }

    stage('Build Docker image') {
      when {
        expression {
          sh(script: 'command -v docker >/dev/null 2>&1', returnStatus: true) == 0
        }
      }
      steps {
        sh 'docker build -t tourism-site:${BUILD_NUMBER} .'
      }
    }
  }
}
