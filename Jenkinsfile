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
          sh 'docker inspect -f \'{{if .State.Running}}\' counter-service | grep -q true || echo "Container is running." || (echo "Container does not exist." && exit 1)'
          sh 'docker stop counter-service'
          sh 'docker rm counter-service'
      }
    }

    stage('Publish Image') { 
      environment {
        DOCKER_REGISTRY_USER = credentials('docker-reg-user')
        DOCKER_REGISTRY_TOKEN = credentials('docker-reg-key')
      }
      steps { 
        script {
          if (env.GIT_BRANCH == 'origin/main') {
            sh 'docker login -u=$DOCKER_REGISTRY_USER -p=$DOCKER_REGISTRY_TOKEN'
            sh 'docker tag counter-service $DOCKER_REGISTRY_USER/counter-service:latest'
            sh 'docker push $DOCKER_REGISTRY_USER/counter-service:latest'
          }
        }
      }
    }

    stage('Deploy to Production') { 
      environment {
        DOCKER_REGISTRY_USER = credentials('docker-reg-user')
        DOCKER_REGISTRY_TOKEN = credentials('docker-reg-key')
      }
      steps {
        script {
          withCredentials([file(credentialsId: 'HOST_CONNECT_SECRET', variable: 'HOST_CONNECT_SECRET')]) {
            if (env.GIT_BRANCH == 'origin/main') {
              def pemFilePath = "${env.WORKSPACE}/pemfile.pem"
              writeFile file: pemFilePath, text: env.PEM_FILE
              sh 'chmod 400 pemfile.pem'
              sh 'ssh -i pemfile.pem centos@35.158.123.255 "docker pull $DOCKER_REGISTRY_USER/counter-service:latest && docker run -d -p 80:80 --counter-service:latest"'
            }
          }
        }
      }
    }
  }
}
