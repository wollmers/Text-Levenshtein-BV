    # else { #TODO
    elsif (0) {

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

# STABILITY

Until release of version 1.00 the included methods, names of methods and their
interfaces are subject to change.

Beginning with version 1.00 the specification will be stable, i.e. not changed between
major versions.

# REFERENCES

\[Hyy03\]
Hyyrö, Heikki. (2003).
A Bit-Vector Algorithm for Computing Levenshtein and Damerau Edit Distances.
In Nord. J. Comput. 10. 29-39.

\[Hyy04a\]
Hyyrö, Heikki. (2004).
A Note on Bit-Parallel Alignment Computation.
In M. Simanek and J. Holub, editors, Stringology, pages 79-87.
Department of Computer Science and Engineering, Faculty of Electrical
Engineering, Czech Technical University, 2004.

\[Hyy04b\]
Hyyrö, Heikki. (2004).
Bit-parallel LCS-length computation revisited.
In Proc. 15th Australasian Workshop on Combinatorial Algorithms (AWOCA 2004), 2004.

\[HN02\]
Hyyrö, Heikki and Navarro, Gonzalo.
Faster bit-parallel approximate string matching.
In Proc. 13th Combinatorial Pattern Matching (CPM 2002),
LNCS 2373, pages 203–224, 2002.

# SEE ALSO

[Text::Levenshtein](https://metacpan.org/pod/Text%3A%3ALevenshtein)

# SOURCE REPOSITORY

[http://github.com/wollmers/Text-Levenshtein-BV](http://github.com/wollmers/Text-Levenshtein-BV)

# AUTHOR

Helmut Wollmersdorfer <helmut@wollmersdorfer.at>

<div>
    <a href='http://cpants.cpanauthors.org/author/wollmers'><img src='http://cpants.cpanauthors.org/author/wollmers.png' alt='Kwalitee Score' /></a>
</div>

# COPYRIGHT AND LICENSE

Copyright 2016-2020 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
