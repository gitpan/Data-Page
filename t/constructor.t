#!perl -T

use warnings;
use strict;
use Test::More;

BEGIN {
  plan tests => 6;
}

BEGIN {
  use_ok( 'Data::Page' );
}

my $has_te;

BEGIN {
  eval "use Test::Exception";
  $has_te = !$@;
}

CHECK_ADJUSTMENT_1: {
  my $page = Data::Page->new(7, 10, 12);
  isa_ok( $page, 'Data::Page' );

  is( $page->first_page, 1, "Adjusted to first possible page" );
}

CHECK_ADJUSTMENT_2: {
  my $page = Data::Page->new(0, 10, -1);
  isa_ok( $page, 'Data::Page' );

  is( $page->first_page, 1, "Adjusted to first possible page" );
}

# Check constructor death
SKIP: {
  skip "Test::Exception required to test constructor failure", 1 unless $has_te;
  throws_ok {
    my $page = Data::Page->new( 12, 0, 1 );
  } qr/one entry per page/, "Can't have entries-per-page less than 1";
}
