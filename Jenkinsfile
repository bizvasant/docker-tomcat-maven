pipeline {
    agent any
	
	  tools
    {
       //maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'docker-tomcat-maven-rollback', url: 'https://github.com/ShivaliSKirdat/docker-tomcat-maven.git'
             
          }
        }
	 stage('Delete Docker Conatiner') {
           steps {
             
                sh 'docker stop samplewebapp'
		sh 'docker rm samplewebapp'
          }
        }
        

  stage('Remove Build Docker Image') {
           steps {
              
                sh 'docker rmi shivalikirdat/samplewebapp:latest'
          }
        }
    }
}
    
