
## By BingLi224
##
## 10:48 THA 06/10/2018
##
## Test the synchonization of shared @list from a package, being manipulated in multiple threads
##

use strict;
use warnings;
use threads;
use threads::shared;

use Data::Dumper;

use Package;

print @list;

print Dumper { 'main-' . \@list => \@list };
sleep 1;

@list = ( "changed by main 1" );

print Dumper { 'main-' . \@list => \@list };

$_ = threads->create ( sub {
	sleep 1;
	print Dumper { 'child-' . \@list => \@list };
	sleep 1;

	@list = ( "changed by child 1" );
	print Dumper { 'child-' . \@list => \@list };

	sleep 2;
	@list = ( "changed by child 2" );
	print Dumper { 'child-' . \@list => \@list };
} );
$_->detach;

sleep 3;

print Dumper { 'main-' . \@list => \@list };

@list = ( "changed by main 2" );

print Dumper { 'main-' . \@list => \@list };

sleep 2;

print Dumper { 'main-' . \@list => \@list };
