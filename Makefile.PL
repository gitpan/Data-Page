use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Data::Page',
    'VERSION_FROM'	=> 'lib/Data/Page.pm', # finds $VERSION
    'PREREQ_PM'		=> { 'Test::More' => 0.1, },
    'dist'              => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Data/Page.pm', # retrieve abstract from module
       AUTHOR     => 'Leon Brocard <acme@astray.com>') : ()),
    'PL_FILES' => {},
    'DIR' => [],
);

sub MY::libscan {
    my $path = $_[1];
    return '' if $path =~ /\B\.svn\b/;
    return $path;
}
