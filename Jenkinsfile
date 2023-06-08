pipeline {
  agent any
  
  stages {
    stage('Print Branch Name') {
      steps {
        script {
          // Get the branch name
          def branchName = env.GIT_BRANCH

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
    
      stage('Print Current Working Directory') {
      steps {
        // Print the content of the current working directory
        sh 'ls -la'
      }
    }

  }
}

