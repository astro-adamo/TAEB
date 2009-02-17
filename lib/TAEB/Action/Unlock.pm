package TAEB::Action::Unlock;
use TAEB::OO;
extends 'TAEB::Action';
with 'TAEB::Action::Role::Direction';

use constant command => 'a';

has implement => (
    traits   => [qw/TAEB::Provided/],
    is       => 'ro',
    isa      => 'NetHack::Item',
    required => 1,
);

has '+direction' => (
    required => 1,
);

sub respond_apply_what { shift->implement->slot }

sub respond_lock {
    shift->target_tile('closeddoor')->state('unlocked');
    'n';
}

sub respond_unlock { 'y' }

sub msg_just_unlocked_door {
    shift->target_tile('closeddoor')->state('unlocked');
}

sub msg_interrupted_unlocking {
    shift->target_tile('closeddoor')->state('locked');
}

sub msg_door {
    my $self = shift;
    my $type = shift;

    my $tile = $self->target_tile('closeddoor');

    if ($type eq 'just_unlocked' && $tile->type eq 'closeddoor') {
        $tile->state('unlocked');
    }
}

__PACKAGE__->meta->make_immutable;
no TAEB::OO;

1;

