pipeline {
  agent {
    label 'jenkins-agent'
  }
  tools {
    jdk 'Java17'
    maven 'Maven-3'
  }
  stages {
    stage ('Clean Up Workspace') {
      steps {
         cleanWs()
      }
    }
    stage ('Check out from scm') {
      steps {
            git branch: "master", credentialsId: "github", url: "https://github.com/zshuvo26/ci-cd-projects"
          }
      }
    stage ('Build Application') {
      steps {
            sh: "mvn clean package"
          }
      }

    stage ('Test Application') {
      steps {
            sh: "mvn test"
          }
      }
  }
}