
task 'Smoke Tests', {
  description = '''This is a placeholder task that can be used to run automated tests on the Production environment. Click on the "Requires Definition" and do one of the following
1.	Select the task of ‘Plugin’ type, select the Category called ‘Test’, select a Plugin for the needed Test Automation system and select the procedure starting name with ‘run..’ and supply values for the needed parameters. OR
2.	Select the task of ‘Procedure’ type and select the Procedure which has commands to run any test automation. Procedures can be used to create reusable automation units which can be used in other objects like Pipelines/Process/Workflow etc
'''
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
