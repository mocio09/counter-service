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
             sh 'ls -la'
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
          sh 'trivy --no-progress counter-service'
      }
    }
  }
}
