
pluginConfiguration 'Jenkins-CTTI', {
  field = [
    'credential': 'credential',
    'debug_level': '0',
    'ignoreSSLErrors': '0',
    'server': 'https://mat.qualitat.solucions.gencat.cat/jenkins',
  ]
  pluginKey = 'EC-Jenkins'

  addCredential 'credential', {
    passwordRecoveryAllowed = '1'
    userName = 'devsecops'

    acl {
      inheriting = '0'

      aclEntry 'user', principalName: 'admin', {
        changePermissionsPrivilege = 'allow'
        executePrivilege = 'allow'
        modifyPrivilege = 'allow'
        readPrivilege = 'allow'
      }
    }
  }
}
