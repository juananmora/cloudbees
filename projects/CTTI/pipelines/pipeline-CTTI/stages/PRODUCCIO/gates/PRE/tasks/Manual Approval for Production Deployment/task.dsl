
task 'Manual Approval for Production Deployment', {
  description = 'This is a placeholder Manual Approval Gate definition to ensure human oversight before beginning the Production deployment for compliance reasons. Click on the "Requires Definition" and select the user or group to seek approval from in the ‘Assignees’ field. '
  instruction = ''
  notificationEnabled = '1'
  notificationTemplate = 'ec_default_gate_task_notification_template'
  taskType = 'APPROVAL'
  approver = [
    'admin',
  ]
}
