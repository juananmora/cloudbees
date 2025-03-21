
procedure 'PublishJon', {
  projectName = 'Sabadell'
  timeLimitUnits = 'minutes'

  formalParameter 'description', defaultValue: '', {
    expansionDeferred = '0'
    label = 'description'
    orderIndex = '1'
    required = '1'
    type = 'entry'
  }

  formalParameter 'repositoryName', defaultValue: 'Sabadell', {
    expansionDeferred = '0'
    orderIndex = '2'
    required = '1'
    type = 'entry'
  }

  formalParameter 'artifactVersion', defaultValue: '', {
    expansionDeferred = '0'
    label = 'Version'
    orderIndex = '3'
    required = '1'
    type = 'entry'
  }

  formalParameter 'artifactName', {
    expansionDeferred = '0'
    required = '1'
    type = 'entry'
  }

  formalParameter 'compress', defaultValue: '1', {
    expansionDeferred = '0'
    required = '0'
    type = 'entry'
  }

  formalParameter 'dependentArtifactVersionList', {
    description = 'Newline-separated list of dependent artifact versions'
    expansionDeferred = '0'
    required = '0'
    type = 'textarea'
  }

  formalParameter 'excludePatterns', {
    description = 'Semicolon-separated list of exclude patterns'
    expansionDeferred = '0'
    required = '0'
    type = 'textarea'
  }

  formalParameter 'followSymlinks', defaultValue: '1', {
    expansionDeferred = '0'
    required = '0'
    type = 'entry'
  }

  formalParameter 'fromLocation', {
    expansionDeferred = '0'
    required = '0'
    type = 'entry'
  }

  formalParameter 'includePatterns', {
    description = 'Semicolon-separated list of include patterns'
    expansionDeferred = '0'
    required = '0'
    type = 'textarea'
  }
}
