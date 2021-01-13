pipeline {
    agent any
    stages {
        stage('Dependencies') {
            steps {
                sh "sudo bash ./scripts/dependencies.sh"
            }
        }
        stage('Terraform') {
            steps {
                sh "bash ./scripts/terraform.sh"
            }
        }
        //stage('Test') {
          //  steps {
            //    sh "bash ./scripts/test.sh"
            //}
        //}    
        //stage('Build') {
         //   steps {
           //     sh "bash ./scripts/build.sh"
            //}
        //}    
        stage('Deploy') {
            steps {
                sh "bash ./scripts/deploy.sh"
            }
        }
    }
}