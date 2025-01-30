
pipeline 'pipeline-CTTI', {
  description = '''This is a sample Pipeline template to manage software delivery from CI to Production Deployments. 
All the tasks are created as placeholders. Click on the \'Information\' icon to see the task description. '''

  formalParameter 'TimeStampForSnapshotName', defaultValue: '$[/timestamp yyyyMMddHHmmss]', {
    label = 'Time stamp to append to the Snapshot name'
    orderIndex = '1'
    type = 'entry'
  }

  formalParameter 'ec_stagesToRun', {
    expansionDeferred = '1'
  }
}
