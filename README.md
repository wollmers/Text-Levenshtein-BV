    else {

      $positions->{$a->[$_]}->[$_ / $width] |= 1 << ($_ % $width) for $amin..$amax;

      my $S;
      my $Vs = [];
      my ($y,$u,$carry);
      my $kmax = $amax / $width + 1;

      # outer loop
      for my $j ($bmin..$bmax) {
        $carry = 0;

        for (my $k=0; $k < $kmax; $k++ ) {
          $S = ($j) ? $Vs->[$j-1]->[$k] : ~0;
          $S //= ~0;
          $y = $positions->{$b->[$j]}->[$k] // 0;
          $u = $S & $y;             # [Hyy04]
          $Vs->[$j]->[$k] = $S = ($S + $u + $carry) | ($S & ~$y);
          $carry = (($S & $u) | (($S | $u) & ~($S + $u + $carry))) >> 63; # TODO: $width-1
        }
      }

    }

    var VP = ~0;
    var VN = 0;
    var diff = a.length;

    var VPs = [];
    var VNs = [];
    var y;
    var u;

    // [HN02] Fig. 3 -> Fig. 7
    for (var j = bmin; j <= bmax; j++) {
        y = (b.charAt(j) in positions) ? positions[b.charAt(j)] : 0;
        X = y | VN;
        D0 = ((VP + (X & VP)) ^ VP) | X;
        HN = VP & D0;
        HP = VN | ~(VP|D0);
        X  = (HP << 1) | 1;
        VN = X & D0;
        VP = (HN << 1) | ~(X | D0);
        VPs[j] = VP;
        VNs[j] = VN;
    }

# NAME

Text::Levenshtein::BV - Bit Vector (BV) implementation of the
                 Levenshtein Algorithm

<div>
    <a href="https://travis-ci.org/wollmers/Text-Levenshtein-BV"><img src="https://travis-ci.org/wollmers/Text-Levenshtein-BV.png" alt="LCS-BV"></a>
    <a href='https://coveralls.io/r/wollmers/Text-Levenshtein-BV?branch=master'><img src='https://coveralls.io/repos/wollmers/Text-Levenshtein-BV/badge.png?branch=master' alt='Coverage Status' /></a>
    <a href='http://cpants.cpanauthors.org/dist/Text-Levenshtein-BV'><img src='http://cpants.cpanauthors.org/dist/Text-Levenshtein-BV.png' alt='Kwalitee Score' /></a>
    <a href="http://badge.fury.io/pl/Text-Levenshtein-BV"><img src="https://badge.fury.io/pl/Text-Levenshtein-BV.svg" alt="CPAN version" height="18"></a>
</div>

# SYNOPSIS

    use Text::Levenshtein::BV;

    $alg = Text::Levenshtein::BV->new;
    @ses = $alg->SES(\@a,\@b);

# ABSTRACT

Text::Levenshtein::BV implements the Levenshtein using bit vectors and
is faster in most cases than the naive implementation using a match matrix.

# DESCRIPTION

## CONSTRUCTOR

- new()

    Creates a new object which maintains internal storage areas
    for the SES computation.  Use one of these per concurrent
    SES() call.

## METHODS

- SES(\\@a,\\@b)

    Finds a Shortest Edit Script (SES), taking two arrayrefs as method
    arguments. It returns an array reference of corresponding
    indices, which are represented by 2-element array refs.

- distance(\\@a,\\@b)

    Calculates the edit distance, taking two arrayrefs as method
    arguments. It returns an integer.

- hunks2sequences(\\@alignment)

    Reformats the alignment returned by SES into an array of two sequences.

- sequence2char(\\@a)

    Renders an array of strings into a string.

- sequences2hunks(\\@a,\\@b)

    Does the revers of method hunks2sequences.

## EXPORT

None by design.

# SEE ALSO

Text::Levenshtein

# AUTHOR

Helmut Wollmersdorfer <helmut.wollmersdorfer@gmail.com>

<div>
    <a href='http://cpants.cpanauthors.org/author/wollmers'><img src='http://cpants.cpanauthors.org/author/wollmers.png' alt='Kwalitee Score' /></a>
</div>

# COPYRIGHT AND LICENSE

Copyright 2016-2020 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# POD ERRORS

Hey! **The above document had some coding errors, which are explained below:**

- Around line 104:

    '=item' outside of any '=over'

- Around line 111:

    '=item' outside of any '=over'

- Around line 117:

    '=item' outside of any '=over'

- Around line 123:

    '=item' outside of any '=over'
