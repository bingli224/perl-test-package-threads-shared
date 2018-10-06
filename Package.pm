
## By BingLi224
##
## 10:48 THA 06/10/2018
##
## Test the synchonization of shared @list from a package, being manipulated in multiple threads
##

package Package;

use strict;
use warnings;
use threads;
use threads::shared;

use Exporter;
our @ISA	= 'Exporter';
our @EXPORT	= qw (
	@list
);
our @EXPORT_OK	= qw (
);

our @list : shared;

@list = ( 'original' );
