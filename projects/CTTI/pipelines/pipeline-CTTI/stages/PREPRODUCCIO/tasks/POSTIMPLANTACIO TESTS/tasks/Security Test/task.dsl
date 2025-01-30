
task 'Security Test', {
  actualParameter = [
    'config_name': '/projects/CTTI/pluginConfigurations/Jenkins-CTTI',
    'escape_char': '',
    'is_json_parameters': '0',
    'jenkins_depend_on_build_result': '1',
    'jenkins_enable_parallel_mode': '0',
    'job_name': 'MAT-PROVES-SEGURETAT-ZAP',
    'need_to_run_report': '1',
    'need_to_trim_key': '1',
    'need_to_trim_value': '1',
    'parameters': '(WEB_URL=http://frontend.conference-app, test_type=baseline',
    'quote_char': '',
    'sep_char': '',
  ]
  errorHandling = 'continueOnError'
  resourceName = 'local'
  stageSummaryParameters = '[{"label":"jenkinsbuildnumber","name":"jenkinsbuildnumber"},{"label":"jenkinsbuildurl","name":"jenkinsbuildurl"},{"label":"jenkinsjoburl","name":"jenkinsjoburl"}]'
  subpluginKey = 'EC-Jenkins'
  subprocedure = 'RunAndWait'
  taskType = 'PLUGIN'
}
