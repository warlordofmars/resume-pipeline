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
        input 'Deployed HTML + Print Preview Look Ok?'
      }
    }

    stage('promote') {
      environment {
        PROMOTE = true
      }
      when {
        branch 'master'
      }
      steps {
        sh './gradlew deploy'
        sh './gradlew print'
      }
    }

  }

  post {
    always {
      archiveArtifacts artifacts: 'resume/build/resume*', fingerprint: true
      junit 'build/report.xml'
    }
  }

}