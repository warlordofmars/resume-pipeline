pipeline {
  agent any
  stages {
    
    stage('build') {
      
      steps {
        sh './gradlew validate'
        sh './gradlew build'
        sh './gradlew build'
        sh './gradlew analyze'
      }
      
    }

    stage('test') {
      steps {
        sh './gradlew deploy -PpreviewHtmlFileName=resume-preview-${BUILD_NUMBER}.html'
        sh './gradlew print'
        input 'How does https://resume-test.warlordofmars.net look?'
        input 'How does printed sample resume look?'
      }
    }

    stage('deploy') {
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