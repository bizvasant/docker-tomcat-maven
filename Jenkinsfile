pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/devops4solutions/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp shivalikirdat/samplewebapp:latest'
                //sh 'docker tag samplewebapp shivalikirdat/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push shivalikirdat/samplewebapp:latest'
        //  sh  'docker push shivalikirdat/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run --name samplewebapp -d -p 8083:8083 shivalikirdat/samplewebapp"
 
            }
        }
  stage('Run Docker container on remote hosts') {
             steps 
	           {
            sshagent(credentials:['ec2-user']){               
		//sh "docker -o StrictHostKeyChecking=no -H ssh://ec2-user@3.144.167.98 run -d -p 8080:8080 shivalikirdat/samplewebapp"
		sh 'ssh -tt -o StrictHostKeyChecking=no  ec2-user@3.144.167.98'
		sh "docker run -d -p 8084:8084 shivalikirdat/samplewebapp"
		  
		  //docker.withServer('tcp://3.144.167.98:8081', '')
		  //sh "docker run -d -p 8081:8081 shivalikirdat/samplewebapp"
 
            }
        }
  }
// 	stage('checkout scm') {
//            steps {
             
// 		   docker.withServer('tcp://3.144.167.98:8081', '')
// 		   sh "docker run -d -p 8081:8081 shivalikirdat/samplewebapp"          
//           }
//         }
    }
}
    
