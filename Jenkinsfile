pipeline {
  agent any
  stages {
    
    stage('build') {
      steps {
        sh './gradlew build'
      }      
    }

    stage('test') {
      steps {
        sh './gradlew deploy -PpreviewHtmlFileName=resume-preview-${BUILD_NUMBER}.html'
        sh './gradlew print'
        input 'How does https://resume-test.warlordofmars.net/resume-preview-${BUILD_NUMBER}.html look?'
        input 'How does printed sample resume look?'
      }
    }

    stage('promote') {
      when {
        branch 'master'
      }
      steps {
        sh './gradlew deploy'
        sh './gradlew print'
      }
    }

  }
}