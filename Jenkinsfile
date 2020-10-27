pipeline {
  def app
  stages {

    stage('Clone repository') {
        checkout scm
    }
    stage('Build image') {
        app = docker.build("getintodevops/hellonode")
    }
    stage('Test image') {
        app.inside {
            parallel {
              stage('Static code analysis') {
                  steps { sh 'npm run-script sonar' }
              }
              stage('Unit tests') {
                  steps { sh 'npm run-script test' }
              }
            }
        }
    }
    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
  }
}
