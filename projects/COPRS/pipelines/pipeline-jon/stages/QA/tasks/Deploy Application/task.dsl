
task 'Deploy Application', {
  description = 'This is a placeholder task that can be used to deploy the latest version of the application into the QA Environment. Click on the "Requires Definition" and select the task of ‘App Process’ type.  Select the appropriate project, application, the process and the environment used for QA. If there are any parameters required, supply the needed values. If the QA environment needs to be dynamically created on any cloud system, select Environment template.  '
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
