import java.io.File


step 'jgit', {
  description = ''
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/jgit/steps/jgit.cmd").text
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  logFileName = ''
  parallel = '0'
  postProcessor = ''
  procedureName = 'jgit'
  projectName = 'Sabadell'
  releaseMode = 'none'
  resourceName = 'local'
  shell = 'bash'
  subprocedure = ''
  subproject = ''
  timeLimit = '0'
  timeLimitUnits = 'seconds'
  workingDirectory = ''
  workspaceName = ''
}
