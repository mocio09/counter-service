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
    
    stage('Test') {
      steps {
          // Run Trivy to scan the Docker image
          sh 'docker run -d -p 8212:80 --name counter-service counter-service'
          sh 'docker inspect -f \'{{if .State.Running}}{{print "Container is running."}}{{else}}{{print "Something is wrong. Container is down"}}{{exit 1}}{{end}}\' counter-service 2>/dev/null'
          sh 'docker stop counter-service'
          sh 'docker rm counter-service'
      }
    }
  }
}
