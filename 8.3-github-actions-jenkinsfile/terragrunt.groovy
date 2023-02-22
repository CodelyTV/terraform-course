pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'curl -LJO https://github.com/gruntwork-io/terragrunt/releases/download/v0.31.3/terragrunt_linux_amd64 && chmod +x terragrunt_linux_amd64'
        sh './terragrunt_linux_amd64 --terragrunt-working-dir=terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh './terragrunt_linux_amd64 --terragrunt-working-dir=terraform plan'
      }
    }
    stage('Terraform Apply') {
      when {
        expression {
          return params.apply == 'true'
        }
      }
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
          sh './terragrunt_linux_amd64 --terragrunt-working-dir=terraform apply -auto-approve'
        }
      }
    }
  }
}