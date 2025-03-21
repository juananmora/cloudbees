
task 'Buildsssss', {
  description = '''This is a placeholder task that can be used to run the build to compile the source code from a SCM system. Click the \'Requires Definition\' link to open the Task Definition dialogue. You have two options:
1. Click on \'Plugin\'. Select the \'Build\' Category. From there you can then select the Plugin that is needed for the SCM system to choose the \'Run\' Procedure. You will then supply values for the required parameters.
2. Click on \'Procedure\'. Select the \'Project\' in which you have \'Run\' Procedures, and next select the appropriate one.'''
  advancedMode = '0'
  allowOutOfOrderRun = '0'
  alwaysRun = '0'
  enabled = '1'
  errorHandling = 'stopOnError'
  insertRollingDeployManualStep = '0'
  projectName = 'COPRS'
  skippable = '0'
  subproject = 'COPRS'
  useApproverAcl = '0'
  waitForPlannedStartDate = '0'
}
