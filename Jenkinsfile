node {
   stage('Preparation') {
      git 'https://github.com/Jimhox/jenkins.git'
   }
   stage('Build') {
      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awscredentials']]) {
      dir('terraform/environments/test/') {
      sh '/opt/terraform init'
      sh '/opt/terraform apply -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_secret_key=$AWS_SECRET_ACCESS_KEY -auto-approve'
      }
    }
   } 
   stage('Destroy'){
      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '9fa21b90-601b-4ab8-9b0d-2de8d6d21ff5']]) {
      dir('terraform/environments/test/') {
        sh '/opt/terraform destroy -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_secret_key=$AWS_SECRET_ACCESS_KEY -force'
      }
   }
   }
    
}
