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
        sh './gradlew analyze'
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
        branch 'master'
      }
      input {
          message "Does it look ok?"
          ok "Yes, looks good.  Lets continue."
      }
    }
    stage('deploy') {
      when {
        branch 'master'
      }
      steps {
        sh 'echo deploy'
      }
    }
    stage('print-final') {
      when {
        branch 'master'
      }
      steps {
        sh './gradlew print'
      }
    }
  }
}