pipeline {
  agent any

  environment {
    DOCKER_BUILDKIT = '1'
  }

  stages {
    stage('Clone Repository') {
      steps {
        git 'https://github.com/amarshaik012/complete-cicd.git'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t complete-cicd .'
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          sh 'rm -rf .terraform .terraform.lock.hcl'
          sh 'terraform init'
        }
      }
    }

    stage('Force Remove Existing Container') {
      steps {
        sh 'docker rm -f complete-cicd-v2 || true'
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }

  post {
    failure {
      echo '❌ Build failed!'
    }
    success {
      echo '✅ Build completed successfully.'
    }
  }
}
