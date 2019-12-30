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
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) {
        sh 'az login --service-principal -u $CLIENT_ID -p $CLIENT_SECRET -t $TENANT_ID'
 steps {
 sh "terraform plan -out=plan"
 }
 }
 
}
}