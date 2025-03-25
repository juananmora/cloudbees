$|=1;
use utf8;
use ElectricCommander;
use ElectricCommander::ArtifactManagement;
use ElectricCommander::ArtifactManagement::ArtifactVersion;


my $cmdr = new ElectricCommander();
my $params = $cmdr->loadProperties({path => "/myCall",
                                    expand => "0",
                                    recurse => "0"});

my @dependents = ();
my $dependentList = $params->{dependentArtifactVersionList};
if ($dependentList) {
    @dependents = split(/\n/, $dependentList);
}

my $am = new ElectricCommander::ArtifactManagement($cmdr);
my $artifactVersion = $am->publish(
    {version => $params->{artifactVersion},
     artifactName => $params->{artifactName},
     description => $params->{description},
     repositoryName => $params->{repositoryName},
     compress => $params->{compress},
     followSymlinks => $params->{followSymlinks},
     includePatterns => $params->{includePatterns},
     excludePatterns => $params->{excludePatterns},
     dependentArtifactVersion => \@dependents});

# Success!!!!! Manuel test

# Print out the xml of the published artifactVersion.
print $artifactVersion->xml() . "\n";

if ($artifactVersion->diagnostics()) {
    print "\nDetails:\n" . $artifactVersion->diagnostics();
}
