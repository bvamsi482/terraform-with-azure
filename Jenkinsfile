pipeline {
    agent any
    environment {
        ARM_SUBSCRIPTION_ID = credentials('Subscription ID')
        ARM_TENANT_ID = credentials('Tenant ID')
        ARM_CLIENT_ID = credentials('Client ID')
        ARM_CLIENT_SECRET = credentials('Client Secret')
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
