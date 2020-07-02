#!perl
use 5.008;

use strict;
use warnings;
use utf8;

use lib qw(../lib/);

use Text::Levenshtein::BV;

use Data::Dumper;
use Time::HiRes qw ( time );

my $ses = Text::Levenshtein::BV->new();

{
my $a = [split('','eonnnnnicaio')];
my $b = [split('','communicato')];
my $align = $ses->SES($a,$b);
#print STDERR '$align: ',Dumper($align);
}

{
my $a = [split('','Choerephon')];
my $b = [split('','Chrerrplzon')];
my $align = $ses->SES($a,$b);
#print STDERR '$align: ',Dumper($align);
}

{
    my $a = [split('','Choerephon')];
    my $b = [split('','Chrerrplzon')];

    my $start = time;
    for (0..200000) { $ses->SES($a,$b); }
    my $rate = 200000 / (time - $start);

    print 'Text::Levenshtein::BV->SES ',$rate,"\n";
    # 46244/s
}
