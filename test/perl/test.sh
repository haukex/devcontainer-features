#!/bin/bash
set -e

# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

id

check "Perl has IO::Socket::SSL" perl -MIO::Socket::SSL -e 'print "Perl $] at $^X on $^O"'

check "cpanm installed" cpanm --version

check "perldoc installed" perldoc -V

check "make installed" make --version

check "local::lib added to .bashrc" grep '^eval.*perl5/lib/perl5 -Mlocal::lib.*$' ~/.bashrc

reportResults
