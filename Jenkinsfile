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
         cleanEs()
      }
    }
    stage ('Check out from scm') {
      steps {
            git branch: "master", credentialId: "github", url: "https://github.com/zshuvo26/ci-cd-projects"
          }
      }
  }
}