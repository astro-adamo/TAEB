#!/usr/bin/env perl
package TAEB::AI::Behavior::Identify;
use TAEB::OO;
extends 'TAEB::AI::Behavior';

sub prepare {
    my $self = shift;

    my @items = grep { $self->pickup($_) } TAEB->inventory->items;
    return 0 unless @items;

    my $item = shift @items;
    my $pt = $item->possibility_tracker;

    if ($pt->can('engrave_useful') && $pt->engrave_useful &&
        $item->match(price => 0) && !TAEB->is_blind) {
        if (TAEB->current_tile->engraving eq '') {
            $self->do(engrave => item => '-');
            $self->currently("Prepping for engrave-id by dusting");
            return 100;
        }
        else {
            $self->do(engrave => item => $item);
            $self->currently("Engrave identifying a wand");
            return 90;
        }
    }

    return 0;
}

sub pickup {
    my $self = shift;
    my $item = shift;

    # we only know how to handle wands
    if ($item->match(class => 'wand', identity => undef)) {
        return 1 if $item->possibility_tracker->engrave_useful;
    }

    return 0;
}

sub urgencies {
    return {
        100 => "prepping for engrave-id by dusting",
         90 => "engrave identifying a wand",
    }
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

