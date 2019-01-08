pipeline {
  agent any
  stages {
    
    stage('build') {
      
      stages {
        stage('validate JSON syntax/schema') {
          steps {
            sh './gradlew validate'
          }
        }
        stage('build resume pdf') {
          steps {
            sh './gradlew build'
          }
        }
        stage('build resume html') {
          steps {
            sh './gradlew build'
          }
        }
        stage('analyze resume') {
          steps {
            sh './gradlew analyze'
          }
        }
      }
      
    }
    stage('stage-deploy') {
      steps {
        sh 'echo deploy'
      }
    }
    stage('print-sample') {
      steps {
        sh './gradlew print'
      }
    }
    
    stage('continue') {
      when {
        branch 'cleanup'
      }
      steps  {
        input 'Does it look ok?'
      }

    }
    stage('deploy') {
      when {
        branch 'cleanup'
      }
      steps {
        sh 'echo deploy'
      }
    }
    stage('print-final') {
      when {
        branch 'cleanup'
      }
      steps {
        sh './gradlew print'
      }
    }
  }
}