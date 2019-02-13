
# resume-pipeline

## Overview

A full CI/CD pipeline to aide in the creation, publishing and delivery of the resumé of John A. Carter from a JSON resume source file.

## Source

This project is a [Gradle Multi Project](https://docs.gradle.org/current/userguide/multi_project_builds.html).  There are two sub-projects that make up the components of this project:

| Source File                              | Description        |
|------------------------------------------|---------------------
| [resume/resume.json](resume/resume.json) | JSON Resume Source |
| [resume/theme](resume/theme)             | JSON Resume Themes |
| [resume/spell_check_ignore.txt](resume/spell_check_ignore.txt) | List of words to ignore during spell check
| [website/website.yaml](website/website.yaml) | CloudFormation template which creates all resources required to build a CloudFront fronted website hosted in S3 |
| [build.gradle](build.gradle) | Main build configuration for project



## Features

| Feature | Details |
|---------|---------|
| **Syntax/Schema Validation** | Resumé source is validated against normal JSON syntax rules, as well as the [JSON Resume Schema](https://jsonresume.org/schema/) |
| **Spell Check** | Resumé source is checked for any spelling errors.  Any unrecognized words can be added to an ignore list if necessary.
| **URL Check** | Resumé source is parsed to find all instances of a valid URL.  Each URL is checked to confirm that the URL is still valid and currently responding
| **Resumé Content Analysis** | Keyword count from resume and gap analysis
| **Multi-Forrmat Build** | Resumé source can be compiled into a number of different output formats:  HTML, PDF, Markdown, YAML
| **Custom Resumé Themes** | Each configured output format can be configured to use a custom [JSON Resume Theme](https://jsonresume.org/themes/)
| **Resumé Deployment** | Resumé will be deployed to several locations for ultimate consumpton:
| **Resumé Deployment - Web** | Resumé is published to a static website hosted in AWS S3
| **Resumé Deployment - Google Drive** | Resumé is published to a Google Drive document
| **Resumé Deployment - iCloud** | Resumé is published to a iCloud Drive document
| **Resumé Deployment - Print** | Resumé is printed using a local printer
| **Syntax Validation** | CloudFormation template syntax is checked against CloudFormation specifications.  All resources defined are check to make sure the match what CloudFormation is expecting.
| **Best Practices Check** | CloudFormation template is analyzed for any deviation from CloudFormation best practices
| **Stack Deployment** | CloudFormation stack deployed from CloudFormation template
| **Test Results** | All tests that are performed throughout the `build` and `deploy` process are captured and recorded in a JUnit-style XML report.<br/><br/>![Test Results Report](https://i.imgur.com/2e8GdDF.png) |
| **Jenkins Pipeline** | All builds orchestrated by Jenkins pipeline <br/><br/>![Simple Pipeline](https://i.imgur.com/ZaVIgzy.png)
| **Realtime Slack Updates** | All builds executed in Jenkins will update Slack along the way as the build progresses. <br/><br/> ![slack screenshot](https://i.imgur.com/AmrJprI.gif)

## Configuration

From [build.gradle](build.gradle):

```gradle
ext {

    // whether or not current build is part of 'promote' stage in Jenkins pipeline
    isPromote = System.env.containsKey('PROMOTE')

    // existing s3 bucket to host cloudforrmation templates
    cloudformationBucket = 'warlordofmars-cloudformation'

    // name of existing route53 zone that will be used by resume website
    domainName = 'warlordofmars.net'

    // existing wild card cert associated with `domainName` configured above
    wildcardCertARN = "arn:aws:acm:us-east-1:247631471946:certificate/471106fc-e3dd-4e0b-a20f-010a6e326283"

    // list of strings to check for in postdeploy check of deployed html resume
    ensureStrings = ['John A. Carter', 'johncarter@warlordofmars.net', '(770) 598-7096']

    // set stack name different if not promote
    stackName = isPromote ? 'ResumeWebsite' : 'ResumeWebsiteTest'

    // define template for resume website cloudformation stack
    cloudformationSource = 'website.yaml'

    // JSON resume source
    resumeSource = 'resume.json'

    // mapping of themes to use for each format
    themes = [
        html: 'theme/node_modules/jsonresume-theme-class/',
        pdf: 'theme/node_modules/jsonresume-theme-short/',
    ]

    // file containing list of words to ignore in spell check
    spellCheckIgnoreList = 'spell_check_ignore.txt'

    // desired resume formats to be built
    resumeFormats = ['html', 'pdf', 'yml', 'md']

    // print out more copies during promote
    numberOfCopies = isPromote ? 10 : 1

    // different resume website domains used for promote vs not-promote
    websiteUrl = isPromote ? 'resume.warlordofmars.net' : 'resume-test.warlordofmars.net'

    // prefex to prepend to assets deploy to resume website
    websitePrefix = isPromote ? '' : "/${version}"

}

slack {
    // slack channel to deliver updates to
    channel 'jenkins'

    // retrieve slack API token from gradle properties
    token getProperty('slack.token')

    // only send slack updates during promote
    enabled isPromote
}
```

## Versioning

Versioning on this project is applied automatically on all changes using the [axion-release-plugin](https://github.com/allegro/axion-release-plugin).  Git tags are created for all released versions, and all available released versions can be viewed in the [Releases](https://github.com/warlordofmars/gradle-json-resume/releases) section of this project.

## Author

* **John Carter** - [warlordofmars](https://github.com/warlordofmars)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [JSON Resume Schema](https://jsonresume.org/schema/) is the schema on which all of this is based
* Using the [warlordofmars](https://github.com/warlordofmars) gradle plugin, [gradle-slack-liveupdate](https://github.com/warlordofmars/gradle-slack-liveupdate), for the realtime updates to Slack
* Using the [warlordofmars](https://github.com/warlordofmars) gradle plugin, [gradle-release-helper](https://github.com/warlordofmars/gradle-release-helper), for automatic versioning, git tagging, and publishing of releases to GitHub
* Using the [warlordofmars](https://github.com/warlordofmars) gradle plugin, [gradle-json-resume](https://github.com/warlordofmars/gradle-json-resume),
* Using the [warlordofmars](https://github.com/warlordofmars) gradle plugin, [gradle-cloudformation-helper](https://github.com/warlordofmars/gradle-cloudformation-helper),
* Using the [warlordofmars](https://github.com/warlordofmars) gradle plugin, [gradle-customtest-helper](https://github.com/warlordofmars/gradle-customtest-helper), for recording custom test results to junit-style XML report
* Using the [warlordofmars](https://github.com/warlordofmars) gradle plugin, [gradle-prerequisites-check](https://github.com/warlordofmars/gradle-prerequisites-check), for validating all required custom prerequisite binaries are already installed on build system