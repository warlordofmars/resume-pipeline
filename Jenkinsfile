pipeline {
  agent any
  stages {
    stage('validate') {
      steps {
        sh './gradlew validate'
      }
    }
    stage('build') {
      parallel {
        stage('build') {
          steps {
            sh './gradlew build'
          }
        }
        stage('analyze') {
          steps {
            sh './gradlew analyze --info'
          }
        }
      }
    }
    stage('print') {
      steps {
        sh './gradlew print'
      }
    }
  }
}