import java.io.File


step 'PublishArtifactVersion', {
  description = ''
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/PublishJon/steps/PublishArtifactVersion.pl").text
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  logFileName = ''
  parallel = '0'
  postProcessor = ''
  procedureName = 'PublishJon'
  projectName = 'Sabadell'
  releaseMode = 'none'
  resourceName = 'local'
  shell = 'cb-perl'
  subprocedure = ''
  subproject = ''
  timeLimit = '0'
  timeLimitUnits = 'minutes'
  workingDirectory = '$[/myCall/fromLocation]'
  workspaceName = 'default'
}
