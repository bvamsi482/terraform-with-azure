pipeline {
agent any
 environment {
     client_id       =  credentials('azuresp')
     client_secret   =  credentials('azuresp')
     subscription_id =  credentials('azuresp')
     tenant_id       =  credentials('azuresp')
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
 sh "terraform plan -out=plan"
 }
 }
 
}
}