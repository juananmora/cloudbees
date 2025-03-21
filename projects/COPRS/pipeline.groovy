pipeline 'pipeline-jon', {
  description = '''This is a sample Pipeline template to manage software delivery from CI to Production Deployments. 
All the tasks are created as placeholders. Click on the \'Information\' icon to see the task description. '''
  projectName = 'COPRS'

  formalParameter 'TimeStampForSnapshotName', defaultValue: '$[/timestamp yyyyMMddHHmmss]', {
    label = 'Time stamp to append to the Snapshot name'
    orderIndex = '1'
    type = 'entry'
  }

  formalParameter 'ec_stagesToRun', {
    expansionDeferred = '1'
  }

  stage 'Dev', {
    pipelineName = 'pipeline-jon'
    task 'Checkout Source Code', {
      description = '''This is a placeholder task that can be used to check out source code from a SCM system. Click the \'Requires Definition\' link to open the Task Definition dialogue. You have two options:
1. Click on \'Plugin\'. Select a \'Plugin Category\' where you can then select \'Source Code Management\'. From there you can choose the Plugin that is needed for the SCM system to select the \'Checkout Code\' Procedure. You will then supply values for the required parameters.
2. Click on \'Procedure\'. Select the \'Project\' in which you have \'Checkout Code\' Procedures, and next select the appropriate one.
'''
      subproject = 'COPRS'
    }

    task 'Build', {
      description = '''This is a placeholder task that can be used to run the build to compile the source code from a SCM system. Click the \'Requires Definition\' link to open the Task Definition dialogue. You have two options:
1. Click on \'Plugin\'. Select the \'Build\' Category. From there you can then select the Plugin that is needed for the SCM system to choose the \'Run\' Procedure. You will then supply values for the required parameters.
2. Click on \'Procedure\'. Select the \'Project\' in which you have \'Run\' Procedures, and next select the appropriate one.'''
      subproject = 'COPRS'
    }

    task 'Unit Test', {
      description = '''This his is a placeholder task that can be used to run unit tests. Click the \'Requires Definition\' link to open the Task Definition dialogue.
Click on \'Procedure\'. Select the \'Project\' in which you have commands to run the Unit Tests, and next select the appropriate one.'''
      subproject = 'COPRS'
    }

    task 'Publish Artifact', {
      description = '''This is a placeholder task that can be used to publish artifacts to an artifact repository. Click the \'Requires Definition\' link to open the Task Definition dialogue. You have two options:
1. If you want to publish to the \'EC-Artifact\' repository, click on \'Plugin\'. Select the \'System\' Category. From there you can then select the \'EC-Artifact\' Plugin, to choose the \'Publish\' Procedure. You will then supply values for the required parameters.
2. If you want to publish to an external artifact repository, click on \'Procedure\'. Select the \'Project\'in which you have commands to publish the artifact to a 3rd party repository, and next select the appropriate one.
'''
      subproject = 'COPRS'
    }

    task 'Deploy Application', {
      description = 'This is a placeholder task that can be used to deploy this latest build along with the rest of the application components into the Dev Environment. Click the \'Requires Definition\' link to open the Task Definition dialogue. Click on \'App Process\'. Select the appropriate project, application, process and environment used in the Dev stage. If there are any parameters, supply the required values.'
      subproject = 'COPRS'
    }
  }

  stage 'QA', {
    pipelineName = 'pipeline-jon'
    gate 'POST', {
      task 'Stop if more than X% of tests fail', {
        description = 'This is a placeholder Automated Gate definition to allow to control the progress of the Pipeline. This could be used to automatically check % success of tests. You can automatically stop the Pipeline progress if condition is not satisfied. Click on the "Requires Definition" and select the rule of the ‘Custom’, and supply the required condition. Please click on the \'?\' icon to understand the needed Javascript syntax.'
        gateType = 'POST'
        subproject = 'COPRS'
      }

      task 'Stop if more than X%25 of tests fail', {
        gateType = 'POST'
        subproject = 'COPRS'
      }
    }

    task 'Deploy Application', {
      description = 'This is a placeholder task that can be used to deploy the latest version of the application into the QA Environment. Click on the "Requires Definition" and select the task of ‘App Process’ type.  Select the appropriate project, application, the process and the environment used for QA. If there are any parameters required, supply the needed values. If the QA environment needs to be dynamically created on any cloud system, select Environment template.  '
      subproject = 'COPRS'
    }

    task 'Test Automation', {
      description = '''This is a placeholder task that can be used to run automated tests on the QA environment. Click on the "Requires Definition" and do one of the following
1.	Select the task of ‘Plugin’ type, select the Category called ‘Test’, select a Plugin for the needed Test Automation system and select the procedure starting name with ‘run..’ and supply values for the needed parameters. OR
2.	Select the task of ‘Procedure’ type and select the Procedure which has commands to run any test automation. Procedures can be used to create reusable automation units which can be used in other objects like Pipelines/Process/Workflow etc

If you wish to add manual testing after the automated tests, you can add another task of \'Manual\' type.'''
      subproject = 'COPRS'
    }
  }

  stage 'Production', {
    pipelineName = 'pipeline-jon'
    gate 'PRE', {
      task 'Manual Approval for Production Deployment', {
        description = 'This is a placeholder Manual Approval Gate definition to ensure human oversight before beginning the Production deployment for compliance reasons. Click on the "Requires Definition" and select the user or group to seek approval from in the ‘Assignees’ field. '
        gateType = 'PRE'
        subproject = 'COPRS'
      }
    }

    task 'Deploy Application', {
      description = 'This is a placeholder task that can be used to deploy the application into the Production environment. Click on the "Requires Definition" and select the task of ‘App Process’ type.  Select the appropriate project, application, the process and the environment used for Production. If there are any parameters required, supply the needed values. If the Production environment needs to be dynamically created on any cloud system, select Environment template.'
      subproject = 'COPRS'
    }

    task 'Smoke Tests', {
      description = '''This is a placeholder task that can be used to run automated tests on the Production environment. Click on the "Requires Definition" and do one of the following
1.	Select the task of ‘Plugin’ type, select the Category called ‘Test’, select a Plugin for the needed Test Automation system and select the procedure starting name with ‘run..’ and supply values for the needed parameters. OR
2.	Select the task of ‘Procedure’ type and select the Procedure which has commands to run any test automation. Procedures can be used to create reusable automation units which can be used in other objects like Pipelines/Process/Workflow etc
'''
      subproject = 'COPRS'
    }
  }

  // Custom properties

  property 'ec_counters', {

    // Custom properties
    pipelineCounter = '2'
  }
}
