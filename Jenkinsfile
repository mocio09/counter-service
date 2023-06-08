pipeline {
  agent any
  
  stages {
    stage('Print Branch Name') {
      steps {
        script {
          def branchName = env.GIT_BRANCH
          echo "Current Branch: ${branchName}"
        }
      }
    }
    
    stage('Build') {
       steps {
             sh 'printenv'
        }
     }
   
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t counter-service .'
      }
    }
    
    stage('Static Scan') {
      steps {
          // Run Trivy to scan the Docker image
          sh 'trivy image counter-service'
      }
    }
    
    stage('Run Docker Container and Run Container') {
      steps {
          // Run Trivy to scan the Docker image
          //sh 'docker run -p 8212:80 --name counter-service counter-service'
          def branchName = env.GIT_BRANCH
      }
    }
  }
}
