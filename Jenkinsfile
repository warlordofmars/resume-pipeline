@Library('github.com/warlordofmars/jenkins-library') _

simplePipelineWithInput(

  // text to disply as part of input step in test stage
  'Deployed HTML + Print Preview Look Ok?',
  
  // artifacts that should be archived
  'resume/build/resume*',

  // docker builder label
  'resume-builder',

  // docker builder args
  "'-v', '${System.env['HOME']}/.m2:/home/gradle/.m2', '-v', '${System.env['HOME']}/.aws:/home/gradle/.aws', '-v', '${System.env['HOME']}/.gradle:/home/gradle/.gradle', '-v', '${workspace}:/home/gradle/src'"

  
)