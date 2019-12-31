pipeline {
    agent any
    environment {
        ARM_SUBSCRIPTION_ID = credentials('subscription_id')
        ARM_TENANT_ID = credentials('tenant_id')
        ARM_CLIENT_ID = credentials('client_id')
        ARM_CLIENT_SECRET = credentials('client_secret')
    }
    stages {
       stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/bvamsi482/terraform-with-azure.git'
              }
            }
        stage('Set Terraform path') {
            steps {
                script {
                def tfHome = tool name: 'Terraform'
                env.PATH = "${tfHome}:${env.PATH}"
                   }
                sh "terraform version"
                   }
        }
        stage('TF Init') {
            steps {
                sh "terraform init"
            }
        }
        stage('TF Plan') {
            steps {
                sh "terraform plan"
            }
        }
    }
}
