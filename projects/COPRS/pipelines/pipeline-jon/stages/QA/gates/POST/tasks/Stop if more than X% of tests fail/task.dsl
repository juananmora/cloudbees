
task 'Stop if more than X% of tests fail', {
  description = 'This is a placeholder Automated Gate definition to allow to control the progress of the Pipeline. This could be used to automatically check % success of tests. You can automatically stop the Pipeline progress if condition is not satisfied. Click on the "Requires Definition" and select the rule of the ‘Custom’, and supply the required condition. Please click on the \'?\' icon to understand the needed Javascript syntax.'
  advancedMode = '0'
  allowOutOfOrderRun = '0'
  alwaysRun = '0'
  enabled = '1'
  errorHandling = 'stopOnError'
  gateType = 'POST'
  insertRollingDeployManualStep = '0'
  projectName = 'COPRS'
  skippable = '0'
  subproject = 'COPRS'
  useApproverAcl = '0'
  waitForPlannedStartDate = '0'
}
