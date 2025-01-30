
acl {
  inheriting = '1'

  aclEntry 'user', principalName: 'project: CTTI', {
    changePermissionsPrivilege = 'allow'
    executePrivilege = 'allow'
    modifyPrivilege = 'allow'
    readPrivilege = 'allow'
  }
}
