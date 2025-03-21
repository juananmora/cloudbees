
task 'Manual Approval for Production Deployment', {
  description = 'This is a placeholder Manual Approval Gate definition to ensure human oversight before beginning the Production deployment for compliance reasons. Click on the "Requires Definition" and select the user or group to seek approval from in the ‘Assignees’ field. '
  advancedMode = '0'
  allowOutOfOrderRun = '0'
  alwaysRun = '0'
  enabled = '1'
  errorHandling = 'stopOnError'
  gateType = 'PRE'
  insertRollingDeployManualStep = '0'
  projectName = 'COPRS'
  skippable = '0'
  subproject = 'COPRS'
  useApproverAcl = '0'
  waitForPlannedStartDate = '0'
}
