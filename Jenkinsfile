pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/amarshaik012/complete-cicd.git'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t complete-cicd .'
      }
    }

    stage('Terraform Deploy') {
      steps {
        dir('terraform') {
          sh 'terraform init'
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}
