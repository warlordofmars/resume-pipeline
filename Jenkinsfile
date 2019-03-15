@Library('github.com/warlordofmars/jenkins-library') _

simplePipelineWithInput(

  // text to disply as part of input step in test stage
  'Deployed HTML + Print Preview Look Ok?',
  
  // artifacts that should be archived
  'resume/build/resume*',

  // docker builder args
  
  // un-privileged user 
  '-u gradle ' + \

  // saved credentials for google drive publish
  '-v $HOME/.credentials/google-drive-uploader:/home/gradle/.credentials/google-drive-uploader ' + \
  
  // local icloud dir for icloud drive publish
  '-v "$HOME/Library/Mobile Documents/com~apple~CloudDocs:/home/gradle/Library/Mobile Documents/com~apple~CloudDocs" ' + \
  
  // TODO: remove this
  // local maven repo for testing SNAPSHOT versions
  '-v $HOME/.m2:/home/gradle/.m2 ' + \

  // local AWS config and credentials
  '-v $HOME/.aws:/home/gradle/.aws ' + \

  // local gradle.properties
  '-v $HOME/.gradle/gradle.properties:/home/gradle/.gradle/gradle.properties'

)