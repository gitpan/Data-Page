use Test::Simple tests => 137;
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

  my @vals = split /\s+/, $line;
#  warn $line;

  my $page = Data::Page->new(@vals[0,1,2]);
#  warn "         First page: ", $page->first_page, "\n";
#  warn "          Last page: ", $page->last_page, "\n";
#  warn "First entry on page: ", $page->first, "\n";
#  warn " Last entry on page: ", $page->last, "\n";

  ok($vals[3] == $page->first_page, "$name: first page");
  ok($vals[4] == $page->last_page, "$name: last page");
  ok($vals[5] == $page->first, "$name: first");
  ok($vals[6] == $page->last, "$name: last");
}

__DATA__
# Initial test
50 10 1    1 5 1 10
50 10 2    1 5 11 20
50 10 3    1 5 21 30
50 10 4    1 5 31 40
50 10 5    1 5 41 50

# Under 10
1 10 1    1 1 1 1
2 10 1    1 1 1 2
3 10 1    1 1 1 3
4 10 1    1 1 1 4
5 10 1    1 1 1 5
6 10 1    1 1 1 6
7 10 1    1 1 1 7
8 10 1    1 1 1 8
9 10 1    1 1 1 9
10 10 1    1 1 1 10

# Over 10
11 10 1    1 2 1 10
11 10 2    1 2 11 11
12 10 1    1 2 1 10
12 10 2    1 2 11 12
13 10 1    1 2 1 10
13 10 2    1 2 11 13

# Under 20
19 10 1    1 2 1 10
19 10 2    1 2 11 19
20 10 1    1 2 1 10
20 10 2    1 2 11 20

# Over 20
21 10 1    1 3 1 10
21 10 2    1 3 11 20
21 10 3    1 3 21 21
22 10 1    1 3 1 10
22 10 2    1 3 11 20
22 10 3    1 3 21 22
23 10 1    1 3 1 10
23 10 2    1 3 11 20
23 10 3    1 3 21 23



