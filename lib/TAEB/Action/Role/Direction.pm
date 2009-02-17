package TAEB::Action::Role::Direction;
use Moose::Role;
use List::MoreUtils 'none';

has direction => (
    traits   => [qw/TAEB::Provided/],
    is       => 'ro',
    isa      => 'Str',
);

sub respond_what_direction { shift->direction }

sub target_tile {
    my $self = shift;
    my $tile = TAEB->current_level->at_direction($self->direction);

    if (@_ && none { $tile->type eq $_ } @_) {
        TAEB->log->action(blessed($self) . " can only handle tiles of type: @_", level => 'warning');
    }

    return $tile;
}

no Moose::Role;

1;

