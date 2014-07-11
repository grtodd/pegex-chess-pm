use strict; use warnings;
package Chess::Grammar;

use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'share/chess.pgx';

sub make_tree {
  {
    '+grammar' => 'chess',
    '+toprule' => 'chess_board',
    'EOL' => {
      '.rgx' => qr/\G\r?\n/
    },
    'chess_board' => {
      '+max' => 8,
      '+min' => 8,
      '.ref' => 'row'
    },
    'position' => {
      '.rgx' => qr/\G([rRhHbBqQkKpP\ ])/
    },
    'row' => {
      '.all' => [
        {
          '+max' => 8,
          '+min' => 8,
          '-flat' => 1,
          '.ref' => 'position'
        },
        {
          '.ref' => 'EOL'
        }
      ]
    }
  }
}

1;
