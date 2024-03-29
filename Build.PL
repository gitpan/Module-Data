
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4202"
  },
  "configure_requires" => {
    "Module::Build" => "0.4202"
  },
  "dist_abstract" => "Introspect context information about modules in \@INC",
  "dist_author" => [
    "Kent Fredric <kentnl\@cpan.org>"
  ],
  "dist_name" => "Module-Data",
  "dist_version" => "0.012",
  "license" => "perl",
  "module_name" => "Module::Data",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Module::Metadata" => 0,
    "Module::Runtime" => 0,
    "Moo" => 0,
    "Path::ScanINC" => "0.011",
    "Path::Tiny" => 0,
    "Sub::Quote" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Carp" => 0,
    "Data::Dump" => 0,
    "FindBin" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "1.001002"
  }
);


my %fallback_build_requires = (
  "Carp" => 0,
  "Data::Dump" => 0,
  "FindBin" => 0,
  "Module::Build" => "0.4202",
  "Test::Fatal" => 0,
  "Test::More" => "1.001002"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
