node {
  git 'https://github.com/bvamsi482/terraform-with-azure.git'
  if(action == 'Deploy') {
    stage('init') {
      sh label: 'terraform init', script: "terraform init"
    }
    stage('plan') {
      sh label: 'terraform plan', script: "terraform plan -out=tfplan -input=false"
      script {
          timeout(time: 10, unit: 'MINUTES') {
              input(id: "Deploy Gate", message: "Deploy ${params.project_name}?", ok: 'Deploy')
          }
      }
    }
    stage('apply') {
      sh label: 'terraform apply', script: "terraform apply tfplan"
    }
  }

  if(action == 'Destroy') {
    stage('plan_destroy') {
      sh label: 'terraform plan', script: "terraform plan -destroy -out=tfdestroyplan -input=false"
    }
    stage('destroy') {
      script {
          timeout(time: 10, unit: 'MINUTES') {
              input(id: "Destroy Gate", message: "Destroy ${params.project_name}?", ok: 'Destroy')
          }
      }
      sh label: 'terraform apply', script: "terraform apply -lock=false -input=false tfdestroyplan"
    }
    stage('cleanup') {
      sh label: 'cleanup', script: "rm -rf terraform.tfstate"
    }
  }
}