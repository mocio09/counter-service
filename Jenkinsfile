pipeline {
  agent any

  stages {
    stage('Print Message') {
      steps {
        echo 'Pipeline triggered by push event'
      }
    }

    stage('Additional Step on Merge') {
      steps {
        echo 'Additional step executed on merge to master'
      }
    }
  }
}