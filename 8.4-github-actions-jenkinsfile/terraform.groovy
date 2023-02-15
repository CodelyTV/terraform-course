pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git url: 'https://github.com/your-organization/your-terraform-repo.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan Terraform') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Apply Terraform') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}