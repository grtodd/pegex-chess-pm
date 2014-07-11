use lib 'lib';
use Pegex::Parser;
use Chess::Grammar;
use Chess::Data;
use IO::All;
use XXX;

my $parser = Pegex::Parser->new(
    grammar => Chess::Grammar->new,
    receiver => Chess::Data->new,
    debug => 1,
);

my $input = io('test/board1.chess')->all;

my $data = $parser->parse($input);

XXX $data;
