@Library('github.com/warlordofmars/jenkins-library') _

simplePipelineWithInput(

  // text to disply as part of input step in test stage
  'Deployed HTML + Print Preview Look Ok?',
  
  // artifacts that should be archived
  'resume/build/resume*',

  // docker builder args
  '-u gradle -v "/Users/john/Library/Mobile Documents/com~apple~CloudDocs:/home/gradle/Library/Mobile Documents/com~apple~CloudDocs" -v /Users/john/.gdrive:/home/gradle/.gdrive -v /Users/john/.m2:/home/gradle/.m2 -v /Users/john/.aws:/home/gradle/.aws -v /Users/john/.gradle/gradle.properties:/home/gradle/.gradle/gradle.properties'

  
)