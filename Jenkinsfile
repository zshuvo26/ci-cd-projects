pipeline {
  agent {
    label 'jenkins-agent'
  }
  tools {
    jdk 'Java17'
    maven 'Maven-3'
  }
  environment{
      dockerimagename = "zshuvo26/spring-boot-web"
      dockerImage = ""
//     APP_NAME= "spring-boot-web"
//     RELEASE= "1.0.0"
//     DOCKER_USER= "zshuvo26"
//     DOCKER_PASS= "dockerhub"
//     IMAGE_NAME="${DOCKER_USER}"+"/"+"${APP_NAME}"
//     IMAGE_TAG="${RELEASE}-${BUILD_NUMBER}"

  }
  stages {
    stage('Clean Up Workspace') {
      steps {
         cleanWs()
      }
    }
    stage('Check out from scm') {
      steps {
            git branch: "master", credentialsId: "github", url: "https://github.com/zshuvo26/ci-cd-projects"
          }
      }
    stage('Build Application') {
      steps {
            sh "mvn clean package"
          }
      }

    stage('Test Application') {
      steps {
            sh "mvn test"
          }
      }

    stage('Sonarqube Analysis') {
      steps {
        script {
          withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token'){
                    sh "mvn sonar:sonar"
                   }
                 }
          }
      }

//     stage('Build and Push Docker Image') {
//       steps {
//         script {
//           docker.withRegistry('',DOCKER_PASS){
//                     docker_image = docker.build "${IMAGE_NAME}"
//                    }
//           docker.withRegistry('',DOCKER_PASS){
//                     docker_image.push("${IMAGE_NAME}")
//                     docker_image.push('latest')
//                    }
//                  }
//           }
//       }
//   }
      stage('Build docker image'){
            steps{
                script{
                dockerImage = docker.build dockerimagename
                }
            }
        }
        stage('Push image to Hub'){
        environment{
        registryCredential = 'dockerhub'
        }
            steps{
                script{
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                               dockerImage.push("latest")

}
               }
           }
        }
}
}