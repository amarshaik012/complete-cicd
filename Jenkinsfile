pipeline {
  agent any

  environment {
    TF_IN_AUTOMATION = 'true'
  }

  stages {
    stage('Clone Repository') {
      steps {
        git 'https://github.com/amarshaik012/complete-cicd.git'
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          // Clean stale Terraform provider data
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
      echo "Terraform applied successfully!"
    }
    failure {
      echo "Build failed!"
    }
  }
}
