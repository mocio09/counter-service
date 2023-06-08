pipeline {
  agent any
  
  stages {
    stage('Print Branch Name') {
      steps {
        script {
          // Get the branch name
          def branchName = env.BRANCH_NAME

          // Print the branch name
          echo "Current Branch: ${branchName}"
        }
      }
    }
    stage('Build') {
       steps {
             sh 'printenv'
        }
     }
  }
}

