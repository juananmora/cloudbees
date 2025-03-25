
pipeline 'Production and Incident', {
  disableMultipleActiveRuns = '0'
  disableRestart = '0'
  enabled = '1'
  overrideWorkspace = '0'
  projectName = 'DORA'
  releaseName = 'Production and Incident'
  skipStageMode = 'ENABLED'

  formalParameter 'ec_stagesToRun', {
    expansionDeferred = '1'
    required = '0'
  }

  formalParameter 'incidentId', {
    expansionDeferred = '0'
    required = '0'
  }
}
