import java.io.File


step 'Set SysID output parameter', {
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/Incident handler/steps/Set SysID output parameter.cmd").text
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  procedureName = 'Incident handler'
  projectName = 'DORA'
  releaseMode = 'none'
  timeLimitUnits = 'minutes'
}
