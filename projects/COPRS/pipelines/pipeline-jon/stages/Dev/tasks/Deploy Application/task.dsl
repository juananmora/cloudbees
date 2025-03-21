
task 'Deploy Application', {
  description = 'This is a placeholder task that can be used to deploy this latest build along with the rest of the application components into the Dev Environment. Click the \'Requires Definition\' link to open the Task Definition dialogue. Click on \'App Process\'. Select the appropriate project, application, process and environment used in the Dev stage. If there are any parameters, supply the required values.'
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
