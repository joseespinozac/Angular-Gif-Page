pipeline {

  stages {

    stage('Clonar repositorio') {
        steps {
            checkout scm
        }

    }
    stage('Contruir imagen') {
        steps {
            def app = docker.build("ssaverdevops/aplicacionAngular")
        }

    }
    stage('Probar imagen') {
        app.inside {
            steps {
                parallel {
                    stage('Analisis de codigo estatico') {
                        steps { sh 'npm run-script sonar' }
                    }
                    stage('Pruebas de unidad') {
                        steps { sh 'npm run-script test' }
                    }
            }
        }
    }
    stage('Registrar imagen') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
  }
}
