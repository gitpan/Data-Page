use Module::Build;
use strict;

my $build = Module::Build->new(
  module_name => 'Data::Page',
  license     => 'perl',
  requires    => {
    'Test::More'  => '0.1',
  },
);
$build->create_build_script;
