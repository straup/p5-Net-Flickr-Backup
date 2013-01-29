# $Id: 00-load.t,v 1.3 2006/06/20 03:31:09 asc Exp $

use strict;
use Test::More;

use File::Basename;
use File::Spec::Functions;
use IPC::Run3;

my @binaries = map { catfile(dirname(__FILE__), "..", "bin", $_) } qw(
    net-flickr-backup-do-backup
    net-flickr-backup-get-auth-token
);

plan tests => 3 * @binaries;

for my $bin (@binaries) {

    ok -e $bin, "$bin exists";
    ok -x $bin, "... and is executable";

    my $error = "";

    run3(
        [ 'perl', '-c', '-w', $bin ],
        undef,
        \$error,
        \$error,
    );

    my $rv = !$?;

    ok $rv, "... and compiles ok";

    if (!$rv && $error) {
        diag $error;
    }
}
