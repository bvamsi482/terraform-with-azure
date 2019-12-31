pipeline {
    agent any
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform-0.12.18"
    }
    environment {
        TF_HOME = tool('terraform-0.12.18')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
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
        stage('TF Init') {
            steps {
                sh "terraform version"
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
