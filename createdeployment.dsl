procedure 'CreateApplicationFromDeploymentPackage', {
  description = ''
  jobNameTemplate = ''
  projectName = 'Electric Cloud'
  resourceName = 'default'
  timeLimit = ''
  timeLimitUnits = 'minutes'
  workspaceName = ''

  formalParameter 'artifactFileName', defaultValue: 'sampleapp.zip', {
    description = ''
    expansionDeferred = '0'
    label = null
    orderIndex = null
    renderCondition = null
    required = '0'
    type = 'entry'
  }

  formalParameter 'artifactKey', defaultValue: 'sample', {
    description = 'Assumes the Application Package zip includes groupid_key/version directory'
    expansionDeferred = '0'
    label = null
    orderIndex = null
    renderCondition = null
    required = '1'
    type = 'entry'
  }

  formalParameter 'artifactVersion', defaultValue: '1.0', {
    description = ''
    expansionDeferred = '0'
    label = null
    orderIndex = null
    renderCondition = null
    required = '1'
    type = 'entry'
  }

  formalParameter 'dslString', defaultValue: '$[/server/ec_selfservice/defaultDslTemplate]', {
    description = 'This how the Service catalog will pass in the DSL associated to a Package Ingester. Use this parameter  to get the DSL that is passed on to the evalDsl'
    expansionDeferred = '0'
    label = null
    orderIndex = null
    renderCondition = null
    required = '0'
    type = 'entry'
  }

  formalParameter 'groupId', defaultValue: 'org.ec', {
    description = ''
    expansionDeferred = '0'
    label = null
    orderIndex = null
    renderCondition = null
    required = '0'
    type = 'entry'
  }

  formalParameter 'retrieveToFolder', defaultValue: '$[/server/ec_selfservice/defaultRetrievetoFolder]', {
    description = ''
    expansionDeferred = '0'
    label = null
    orderIndex = null
    renderCondition = null
    required = '1'
    type = 'entry'
  }

  step 'Set Paths', {
    description = ''
    alwaysRun = '0'
    broadcast = '0'
    command = '''use strict;
use warnings;
use lib qw(..);
use ElectricCommander;
use File::Basename;
use File::Spec;

my $ec = new ElectricCommander({debug =>1});

my $basicPath = File::Spec->rel2abs("$[retrieveToFolder]");
my $destPath  = File::Spec->rel2abs($basicPath . "/$[groupId]_$[artifactKey]/$[artifactVersion]");
my $zipPath   = File::Spec->rel2abs($basicPath . "/$[artifactFileName]");
my $manifestPathFolder = $destPath;
my $manifestPath       = File::Spec->rel2abs($manifestPathFolder . "/manifest.json");

$ec->setProperty({propertyName => "/myJob/zipPath", value => "$zipPath"});
$ec->setProperty({propertyName => "/myJob/destPath", value => "$destPath"});
$ec->setProperty({propertyName => "/myJob/manifestPathFolder", value => "$manifestPathFolder"});
$ec->setProperty({propertyName => "/myJob/manifestPath", value => "$manifestPath"});'''
    condition = ''
    errorHandling = 'failProcedure'
    exclusiveMode = 'none'
    logFileName = ''
    parallel = '0'
    postProcessor = ''
    precondition = ''
    procedureName = 'CreateApplicationFromDeploymentPackage'
    releaseMode = 'none'
    resourceName = ''
    shell = 'ec-perl'
    subprocedure = null
    subproject = null
    timeLimit = ''
    timeLimitUnits = 'minutes'
    workingDirectory = ''
    workspaceName = ''
  }

  step 'Retrieve Application Package From Artifact Repository', {
    description = 'Retrieve Application Package From Artifact Repository'
    actualParameter = [
      'artifactName': '$[groupId]:$[artifactKey]',
      'artifactVersionLocationProperty': '/myJob/retrievedArtifactVersions/$[assignedResourceName]',
      'filterList': '',
      'overwrite': 'update',
      'retrieveToDirectory': '$[retrieveToFolder]',
      'versionRange': '$[artifactVersion]',
    ]
    alwaysRun = '0'
    broadcast = '0'
    command = null
    condition = ''
    errorHandling = 'abortProcedureNow'
    exclusiveMode = 'none'
    logFileName = null
    parallel = '0'
    postProcessor = null
    precondition = ''
    procedureName = 'CreateApplicationFromDeploymentPackage'
    releaseMode = 'none'
    resourceName = ''
    shell = null
    subprocedure = 'Retrieve'
    subproject = '/plugins/EC-Artifact/project'
    timeLimit = ''
    timeLimitUnits = 'minutes'
    workingDirectory = null
    workspaceName = ''
  }

  step 'Unzip Application Package', {
    description = ''
    actualParameter = [
      'destinationDir': '$[/myJob/destPath]',
      'zipFile': '$[/myJob/zipPath]',
    ]
    alwaysRun = '0'
    broadcast = '0'
    command = null
    condition = ''
    errorHandling = 'abortProcedureNow'
    exclusiveMode = 'none'
    logFileName = null
    parallel = '0'
    postProcessor = null
    precondition = ''
    procedureName = 'CreateApplicationFromDeploymentPackage'
    releaseMode = 'none'
    resourceName = ''
    shell = null
    subprocedure = 'Unzip File'
    subproject = '/plugins/EC-FileOps/project'
    timeLimit = ''
    timeLimitUnits = 'minutes'
    workingDirectory = null
    workspaceName = ''
  }

  step 'Set Manifest Content from file', {
    description = ''
    alwaysRun = '0'
    broadcast = '0'
    command = '''use strict;
use warnings;
use ElectricCommander;
use lib qw(..);
use JSON;
use Data::Dumper;
use XML::Simple;

my $ec = new ElectricCommander({debug =>1});

my $manifestPathFolder = File::Spec->rel2abs("$[retrieveToFolder]/$[groupId]_$[artifactKey]/$[artifactVersion]");
my $manifestPath       = File::Spec->rel2abs("$manifestPathFolder/manifest.json");

open (my $fh, $manifestPath) or die "could not open $manifestPath: $!";
my $jsonData = join \'\', <$fh>;
print $jsonData;
close $fh;

$ec->setProperty({propertyName => "/myJob/manifestJson", value => "$jsonData"});'''
    condition = ''
    errorHandling = 'abortProcedureNow'
    exclusiveMode = 'none'
    logFileName = ''
    parallel = '0'
    postProcessor = ''
    precondition = ''
    procedureName = 'CreateApplicationFromDeploymentPackage'
    releaseMode = 'none'
    resourceName = ''
    shell = 'ec-perl'
    subprocedure = null
    subproject = null
    timeLimit = ''
    timeLimitUnits = 'minutes'
    workingDirectory = ''
    workspaceName = ''
  }

  step 'Publish Component Artifacts Based on Manifest', {
    description = 'Publish Component Artifacts included on Application Package'
    alwaysRun = '0'
    broadcast = '0'
    command = '''use strict;
use warnings;
use ElectricCommander;
use lib qw(..);
use JSON;
use Data::Dumper;
use XML::Simple;

my $ec = new ElectricCommander({debug =>1});


# Get manifest content
my $manifestPathFolder = File::Spec->rel2abs("$[retrieveToFolder]/$[groupId]_$[artifactKey]/$[artifactVersion]");
my $jsonData = qq{ $[/myJob/manifestJson] };

# Publish artifacts
local $/ = undef;
my $json = JSON->new;

my $data = $json->decode( $jsonData );

my @components = @{ $data->{\'application\'}{\'components\'}{\'component\'} };
foreach my $f ( @components ) {

   my $_artifactName    = $f->{\'artifact\'}{\'artifactName\'};
   my $_artifactVersion = $f->{\'artifact\'}{\'artifactVersion\'};
   my $_includePatterns = $f->{\'artifact\'}{\'artifactFileName\'};
   my $_artifactDescription = $f->{\'artifact\'}{\'issueKey\'};
   my $_repositoryName  = "$[/server/ec_selfservice/defaultRepository]";

   my $artifactFile = File::Spec->catfile($manifestPathFolder, $_includePatterns);

 if (-e $artifactFile) {

   # Delete Artifact Versions if exist
   $ec->deleteArtifactVersion($_artifactName . ":" . $_artifactVersion);

   # Publish Artifact Versions
   $ec->publishArtifactVersion({
                  artifactName => $_artifactName,
                  version => $_artifactVersion,
                  description => $_artifactDescription,
                  includePatterns => $_includePatterns,
                  fromDirectory => $manifestPathFolder,
                  repositoryName => $_repositoryName
      });
 }
}          '''
    condition = ''
    errorHandling = 'abortProcedureNow'
    exclusiveMode = 'none'
    logFileName = ''
    parallel = '0'
    postProcessor = ''
    precondition = ''
    procedureName = 'CreateApplicationFromDeploymentPackage'
    releaseMode = 'none'
    resourceName = ''
    shell = 'ec-perl'
    subprocedure = ''
    subproject = ''
    timeLimit = '0'
    timeLimitUnits = 'minutes'
    workingDirectory = ''
    workspaceName = ''
  }

  step 'Clean Up Application Package From Artifact Repository', {
    description = ''
    alwaysRun = '1'
    broadcast = '0'
    command = '''use strict;
use warnings;
use ElectricCommander;
use lib qw(..);

my $ec = new ElectricCommander({debug =>1});

# Clean Up Artifact
$ec->deleteArtifact("$[groupId]:$[artifactKey]");'''
    condition = ''
    errorHandling = 'ignore'
    exclusiveMode = 'none'
    logFileName = ''
    parallel = '0'
    postProcessor = ''
    precondition = ''
    procedureName = 'CreateApplicationFromDeploymentPackage'
    releaseMode = 'none'
    resourceName = ''
    shell = 'ec-perl'
    subprocedure = null
    subproject = null
    timeLimit = ''
    timeLimitUnits = 'minutes'
    workingDirectory = ''
    workspaceName = ''
  }

  // Custom properties

  property 'ec_customEditorData', {

    // Custom properties

    property 'parameters', {

      // Custom properties

      property 'applicationType', {

        // Custom properties

        property 'options', {

          // Custom properties

          property 'option1', {

            // Custom properties

            property 'text', value: 'JBOSS', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }

            property 'value', value: 'JBOSS', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }
          }

          property 'option2', {

            // Custom properties

            property 'text', value: 'TOMCAT', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }

            property 'value', value: 'TOMCAT', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }
          }

          property 'option3', {

            // Custom properties

            property 'text', value: 'WEBLOGIC', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }

            property 'value', value: 'WEBLOGIC', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }
          }

          property 'option4', {

            // Custom properties

            property 'text', value: 'WEBSPHERE', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }

            property 'value', value: 'WEBSPHERE', {
              expandable = '1'
              initialValue = null
              suppressValueTracking = '0'
            }
          }
          optionCount = '4'

          property 'type', value: 'list', {
            expandable = '1'
            initialValue = null
            suppressValueTracking = '0'
          }
        }
        formType = 'standard'
      }

      property 'artifactFileName', {

        // Custom properties
        formType = 'standard'
      }

      property 'artifactKey', {

        // Custom properties
        formType = 'standard'
      }

      property 'artifactName', {

        // Custom properties
        formType = 'standard'
      }

      property 'artifactVersion', {

        // Custom properties
        formType = 'standard'
      }

      property 'destPath', {

        // Custom properties
        formType = 'standard'
      }

      property 'dslString', {

        // Custom properties
        formType = 'standard'
      }

      property 'groupId', {

        // Custom properties
        formType = 'standard'
      }

      property 'helloPath', {

        // Custom properties
        formType = 'standard'
      }

      property 'pathToUnzip', {

        // Custom properties
        formType = 'standard'
      }

      property 'pathToZip', {

        // Custom properties
        formType = 'standard'
      }

      property 'retrieveToFolder', {

        // Custom properties
        formType = 'standard'
      }

      property 'unzipPath', {

        // Custom properties
        formType = 'standard'
      }
    }

    property 'dslString', value: 'dslString', {
      expandable = '1'
      initialValue = null
      suppressValueTracking = '0'
    }
    selfServiceUIForm = 'ec_customUI'
  }

  property 'dslString', value: 'dslString', {
    expandable = '1'
    initialValue = null
    suppressValueTracking = '0'
  }
  ec_customUI = '''{
  "sections": {
    "section": [{
      "name": "Upload Package",
      "instruction": "Please upload a zip file containing deployment artifacts and manifest file.",
      "ec_parameterForm": "<editor> <formElement> <type>packageUpload</type> <label>Artifact Upload:</label> <property>artifactUpload</property> <required>1</required> <documentation>Artifact Upload formElement type. This will be expander by the UI</documentation> </formElement> </editor>"
    }],
    "endTarget": {
      "object": "application",
      "formValue": "applicationName"
    }
  }
}'''
}
