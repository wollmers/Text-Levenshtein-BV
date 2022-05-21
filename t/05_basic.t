#!perl
use 5.008;

use strict;
use warnings;
use utf8;

use lib qw(
../lib/
./lib/
);

use Test::More;
use Test::More::UTF8;

my $class = 'Text::Levenshtein::BV';

use_ok($class);

my $object = new_ok($class);

if (1) {
    ok( $object = Text::Levenshtein::BV::new(), 'Text::Levenshtein::BV::new()' );
    ok( $object = $class->new(), '$class->new()' );
    is( scalar keys %$object, 0, 'is scalar keys %$object, 0' );

    ok( $object = $class->new(1,2), '$class->new(1,2)' );
    is( $object->{1}, 2,            'is $object->{1}, 2' );

    ok( $object = $class->new({}), '$class->new({})');
    is( scalar keys %$object, 0,   'is scalar keys %$object, 0');

    ok( $object = $class->new({a => 1}), '$class->new({a => 1})' );
    is( $object->{a}, 1,                 'is $object->{a}, 1' );

    ok( $object = $class->new( a => 1, b => 2 ), '$class->new( a => 1, b => 2 )' );
    is( $object->{a}, 1, 'is $object->{a}, 1' );
    is( $object->{b}, 2, 'is $object->{b}, 2' );

    ok( $object->new(), '$object->new()' );
}

if (1) {
    $object = new_ok($class);
    my $lv;
    ok( $lv = $object->new(), '$object->new()' );
    is( scalar keys %$lv, 0, 'is scalar keys %$object, 0' );

    ok( $lv = $object->new(1,2), '$object->new(1,2)' );
    is( $lv->{1}, 2,            'is $object->{1}, 2' );

    ok( $lv = $object->new({}), '$object->new({})');
    is( scalar keys %$lv, 0,   'is scalar keys %$object, 0');

    ok( $lv = $object->new({a => 1}), '$object->new({a => 1})' );
    is( $lv->{a}, 1,                 'is $object->{a}, 1' );

    ok( $lv = $object->new( a => 1, b => 2 ), '$object->new( a => 1, b => 2 )' );
    is( $lv->{a}, 1, 'is $object->{a}, 1' );
    is( $lv->{b}, 2, 'is $object->{b}, 2' );

    ok( $lv->new(), '$object->new()' );
}

done_testing;
