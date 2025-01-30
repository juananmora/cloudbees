
task 'Scan Code', {
  actualParameter = [
    'config_name': '/projects/CTTI/pluginConfigurations/Jenkins-CTTI',
    'escape_char': '',
    'is_json_parameters': '0',
    'jenkins_depend_on_build_result': '1',
    'jenkins_enable_parallel_mode': '0',
    'job_name': 'MAT-QUALITAT-CODI-SONARQUBE/job/angular',
    'need_to_run_report': '1',
    'need_to_trim_key': '1',
    'need_to_trim_value': '1',
    'parameters': '(repositorio=http://gitea.gitea/petclinic/petclinic-frontend-angular.git, rama=master, projectkey=petclinic-frontend-angular',
    'quote_char': '',
    'sep_char': '',
  ]
  enabled = '0'
  errorHandling = 'continueOnError'
  resourceName = 'local'
  stageSummaryParameters = '[{"label":"jenkinsbuildnumber","name":"jenkinsbuildnumber"},{"label":"jenkinsbuildurl","name":"jenkinsbuildurl"},{"label":"jenkinsjoburl","name":"jenkinsjoburl"}]'
  subpluginKey = 'EC-Jenkins'
  subprocedure = 'RunAndWait'
  taskType = 'PLUGIN'
}
