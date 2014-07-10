use Pegex;
use XXX;

# Pegex Grammar
my $grammar = <<'...';

chess-board: <row>8

row: -<position>8 EOL

position: / ([rRhHbBqQkKpP SPACE]) /
...

# Receiver / Action class
{
    package Chess;
    use Pegex::Base;
    extends 'Pegex::Tree';

    sub got_row {
        my ($self, $got) = @_;
        [ map { s/ /_/; $_ } @$got ];
    }
}

# Input to parse
my $input = <<'...';
RP    pr
HP    ph
BP    pb
KP    pk
QP    pq
BP    pb
HP    ph
RP    pr
...

# Try turning on the debug!
# $Pegex::Parser::Debug = 1;

# Parse the input according to the Grammar, and the Receiver turns it into
# what you want. XXX is just like 'die YAML::Dump ...':
XXX pegex($grammar, 'Chess')->parse($input);
