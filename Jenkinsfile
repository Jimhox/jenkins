node {
   def result    
   stage('Checkout') {
		git 'https://github.com/skekpro/jenkins.git'
   }
   stage('Init'){
    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awscredentials']]) {
		dir('terraform/environments/test/') {
			sh '/opt/terraform init -backend-config="access_key=$AWS_ACCESS_KEY_ID" -backend-config="secret_key=$AWS_SECRET_ACCESS_KEY"'
		}
    }
   }
   stage('Compare') {
	withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awscredentials']]) {
		dir('terraform/environments/test/') {
			result = sh (returnStdout: true, script: 
			'''/opt/terraform plan -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_secret_key=$AWS_SECRET_ACCESS_KEY|grep "forces new resource"||echo "nodiff"
			''').trim()
		}
	}
   }
   if (result != "nodiff"){
	stage('Email'){
      mail (to: 'kgraham@luxoft.com',
      subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) ",
      body: "Difference is ${result}."); 
	}
   }
}
