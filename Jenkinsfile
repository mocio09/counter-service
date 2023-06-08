pipeline {
  agent any
  
  stages {
    stage('Print Branch Name') {
     script {
       // Get the branch name
       def branchName = env.BRANCH_NAME

       // Print the branch name
       echo "Current Branch: ${branchName}"
      }
    }
    stage('Checkout') {
      steps {
        git branch: "${env.BRANCH_NAME}", url: 'https://github.com/mocio09/counter-service.git'
      }
    }
  }
}

