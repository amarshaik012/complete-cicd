pipeline {
  agent any

  environment {
    TF_IN_AUTOMATION = 'true'
  }

  stages {
    stage('Clone Repository') {
      steps {
        checkout scm
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

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }

  post {
    success {
      echo "✅ Terraform applied successfully!"
    }
    failure {
      echo "❌ Build failed!"
    }
  }
}
