
pipeline 'pipeline-jon', {
  description = '''This is a sample Pipeline template to manage software delivery from CI to Production Deployments. 
All the tasks are created as placeholders. Click on the \'Information\' icon to see the task description. '''
  disableMultipleActiveRuns = '0'
  disableRestart = '0'
  enabled = '1'
  overrideWorkspace = '0'
  projectName = 'COPRS'
  skipStageMode = 'ENABLED'

  formalParameter 'TimeStampForSnapshotName', defaultValue: '$[/timestamp yyyyMMddHHmmss]', {
    description = ''
    expansionDeferred = '0'
    label = 'Time stamp to append to the Snapshot name'
    orderIndex = '1'
    required = '0'
    type = 'entry'
  }

  formalParameter 'ec_stagesToRun', {
    description = ''
    expansionDeferred = '1'
    required = '0'
  }
}
