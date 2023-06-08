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
    
      stage('Print Current Working Directory') {
      steps {
        // Print the content of the current working directory
        sh 'ls -la'
      }
    }
   
     stage('Build Docker Image') {
      steps {
        sh 'curl -sSL https://get.docker.com/ | sh'
        sh 'sudo service docker start'
        sh 'docker build -t counter-service .'
      }
    }

     stage('Static Scan') {
      steps {
        // Install and run static scanning only for the 'master' branch
          // Install Trivy (assuming it is available in the Jenkins environment)
          sh 'wget https://github.com/aquasecurity/trivy/releases/download/v0.19.2/trivy_0.19.2_Linux-64bit.tar.gz'
          sh 'tar zxvf trivy_0.19.2_Linux-64bit.tar.gz'
        
          // Run Trivy to scan the Docker image
          sh 'trivy --no-progress counter-service'
      }
    }
  }
}
