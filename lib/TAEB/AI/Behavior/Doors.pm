#!/usr/bin/env perl
package TAEB::AI::Behavior::Doors;
use Moose;
extends 'TAEB::AI::Behavior';

sub prepare {
    my $self = shift;

    return 0 unless TAEB->senses->can_kick;

    my $found_door;
    TAEB->each_adjacent(sub {
        my ($tile, $dir) = @_;
        if ($tile->glyph eq ']') {
            $self->commands([chr(4) . $dir]);
            $self->currently("Kicking down a door");
            $found_door = 1;
        }
    });
    return 100 if $found_door;

    return 0 unless TAEB->map_like(qr/\]/);

    my $path = TAEB::World::Path->first_match(sub { shift->glyph eq ']' });
    $self->path($path);

    return $path && length($path->path) ? 80 : 0;
}

1;

