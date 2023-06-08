pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        git branch: "${env.BRANCH_NAME}", url: 'https://github.com/your/repository.git'
      }
    }

    stage('Additional Step on Merge') {
      steps {
        echo 'Additional step executed on merge to master'
      }
    }
  
}

