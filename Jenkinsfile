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
        sh 'docker build -t amar0126/complete-cicd:latest .'
      }
    }

    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh '''
            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
            docker push amar0126/complete-cicd:latest
          '''
        }
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          sh '''
            rm -rf .terraform .terraform.lock.hcl
            terraform init -upgrade
          '''
        }
      }
    }

    stage('Remove Existing Container') {
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

    stage('Kubernetes Deploy') {
      steps {
        sh '''
          kubectl apply -f k8s/deployment.yaml
          kubectl apply -f k8s/service.yaml
        '''
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
