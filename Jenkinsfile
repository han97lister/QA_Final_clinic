pipeline {
    agent any
    stages {
        stage('Terraform') {
            steps {
                sh "./scripts/terraform.sh"
            }
        }
        stage('Dependencies') {
            steps {
                sh "./scripts/dependencies.sh"
            }
        }
        stage('Test') {
            steps {
                sh "./scripts/test.sh"
            }
        }    
        stage('Build') {
            steps {
                sh "./scripts/build.sh"
            }
        }    
        stage('Deploy') {
            steps {
                sh "./scripts/deploy.sh"
            }
        }
    }
}