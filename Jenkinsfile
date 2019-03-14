@Library('github.com/warlordofmars/jenkins-library') _

simplePipelineWithInput(

  // text to disply as part of input step in test stage
  'Deployed HTML + Print Preview Look Ok?',
  
  // artifacts that should be archived
  'resume/build/resume*',

  // docker builder args
  '-u gradle -v $HOME/.m2:/home/gradle/.m2 -v $HOME/.aws:/home/gradle/.aws -v $HOME/.gradle:/home/gradle/.gradle'

  
)