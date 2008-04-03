#!/usr/bin/env perl
package TAEB::AI::Behavior::Wish;
use TAEB::OO;
extends 'TAEB::AI::Behavior';

sub prepare {
    my $self = shift;

    my $wand = TAEB->find_item(sub {
        shift->match(identity => 'wand of wishing',
                     charges  => [undef, sub { shift > 0 }]);
    });

    return 0 unless $wand;

    $self->do(zap => item => $wand);
    $self->currently("Zapping a wand of wishing");
    return 100;
}

sub urgencies {
    return {
        100 => "zapping a wand of wishing for a wish",
    };
}

sub pickup {
    my $self = shift;
    my $item = shift;

    return 0 unless $item->match(identity => 'wand of wishing');

    return 1;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

