#!/usr/bin/perl -w

use strict;
use Test::More tests => 239;
use Data::Page;
ok(1, "Loaded module"); # If we made it this far, we're ok.

my $name;

foreach my $line (<DATA>) {
  chomp $line;
  next unless $line;

  if ($line =~ /^# ?(.+)/) {
    $name = $1;
    next;
  }

  my @vals = map { $_ = undef if $_ eq 'undef'; $_ } split /\s+/, $line;
#  warn $line;

  my $page = Data::Page->new(@vals[0,1,2]);
#  warn "         First page: ", $page->first_page, "\n";
#  warn "          Last page: ", $page->last_page, "\n";
#  warn "First entry on page: ", $page->first, "\n";
#  warn " Last entry on page: ", $page->last, "\n";

  is($vals[3], $page->first_page, "$name: first page");
  is($vals[4], $page->last_page, "$name: last page");
  is($vals[5], $page->first, "$name: first");
  is($vals[6], $page->last, "$name: last");
  is($vals[7], $page->previous_page, "$name: previous_page");
  is($vals[8], $page->current_page, "$name: current_page");
  is($vals[9], $page->next_page, "$name: next_page");
}

__DATA__
# Initial test
50 10 1    1 5 1 10 undef 1 2
50 10 2    1 5 11 20 1 2 3
50 10 3    1 5 21 30 2 3 4
50 10 4    1 5 31 40 3 4 5
50 10 5    1 5 41 50 4 5 undef

# Under 10
1 10 1    1 1 1 1 undef 1 undef
2 10 1    1 1 1 2 undef 1 undef
3 10 1    1 1 1 3 undef 1 undef
4 10 1    1 1 1 4 undef 1 undef
5 10 1    1 1 1 5 undef 1 undef
6 10 1    1 1 1 6 undef 1 undef
7 10 1    1 1 1 7 undef 1 undef
8 10 1    1 1 1 8 undef 1 undef
9 10 1    1 1 1 9 undef 1 undef
10 10 1    1 1 1 10 undef 1 undef

# Over 10
11 10 1    1 2 1 10 undef 1 2
11 10 2    1 2 11 11 1 2 undef
12 10 1    1 2 1 10 undef 1 2
12 10 2    1 2 11 12 1 2 undef
13 10 1    1 2 1 10 undef 1 2
13 10 2    1 2 11 13 1 2 undef

# Under 20
19 10 1    1 2 1 10 undef 1 2
19 10 2    1 2 11 19 1 2 undef
20 10 1    1 2 1 10 undef 1 2
20 10 2    1 2 11 20 1 2 undef

# Over 20
21 10 1    1 3 1 10 undef 1 2
21 10 2    1 3 11 20 1 2 3
21 10 3    1 3 21 21 2 3 undef
22 10 1    1 3 1 10 undef 1 2
22 10 2    1 3 11 20 1 2 3
22 10 3    1 3 21 22 2 3 undef
23 10 1    1 3 1 10 undef 1 2
23 10 2    1 3 11 20 1 2 3
23 10 3    1 3 21 23 2 3 undef
