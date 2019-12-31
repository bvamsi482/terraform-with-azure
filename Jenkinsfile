pipeline {
    agent any
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
            withCredentials([azureServicePrincipal(credentialsId: 'Terraform-temp',
                                    subscriptionIdVariable: 'AZURE_SUBSCRIPTION_ID',
                                    clientIdVariable: 'AZURE_CLIENT_ID',
                                    clientSecretVariable: 'AZURE_CLIENT_SECRET',
                                    tenantIdVariable: 'AZURE_TENANT_ID')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID' 
            steps {
                sh "terraform plan"
            }
        }
    }
}
