pipeline {
  agent any
  stages {
    stage('validate') {
      steps {
        sh './gradlew validate'
      }
    }
    stage('build') {
      steps {
        sh './gradlew build'
      }
    }
    stage('print') {
      steps {
        sh './gradlew print'
      }
    }
  }
}