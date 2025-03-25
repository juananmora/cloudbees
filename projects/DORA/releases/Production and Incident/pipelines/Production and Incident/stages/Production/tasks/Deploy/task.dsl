import java.io.File


task 'Deployssssss', {
  advancedMode = '0'
  allowOutOfOrderRun = '0'
  alwaysRun = '0'
  applicationName = 'Sample Application'
  applicationProjectName = 'DORA'
  applicationVersion = '1.0'
  artifacts = 'comp:1.1.0'
  command = new File(projectDir, "./releases/Production and Incident/pipelines/Production and Incident/stages/Production/tasks/Deploy.cmd").text
  enabled = '1'
  environmentName = 'Production'
  environmentProjectName = 'DORA'
  errorHandling = 'stopOnError'
  insertRollingDeployManualStep = '0'
  projectName = 'DORA'
  skippable = '0'
  subTaskType = 'DEPLOY'
  taskType = 'COMMAND'
  useApproverAcl = '0'
  waitForPlannedStartDate = '0'
}
