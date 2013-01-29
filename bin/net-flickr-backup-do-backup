#!/usr/bin/env perl
# -*-perl-*-

use strict;

use Net::Flickr::Backup;
use Log::Dispatch::Screen;
use Getopt::Std;

{
  &main();
  exit;
}

sub main {

  my %opts = ();
  getopts('c:v', \%opts);

  my $cfg = Config::Simple->new($opts{'c'}) || die $!;

  my $flickr = Net::Flickr::Backup->new($cfg);

  if ($opts{'v'}){
      my $debug = Log::Dispatch::Screen->new('name' => 'debug', 'min_level' => 'debug');
      $flickr->log()->add($debug);
  }

  $flickr->backup();
  return 1;
}

