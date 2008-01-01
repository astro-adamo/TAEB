#!/usr/bin/env perl
package TAEB::AI::Behavior;
use Moose;

has path => (
    is  => 'rw',
    isa => 'TAEB::World::Path',
    trigger => sub {
        my ($self, $path) = @_;
        my @commands = split '', ($path ? $path->path : '');
        $self->commands(\@commands);
    },
);

has currently => (
    is  => 'rw',
    isa => 'Str',
);

has commands => (
    is      => 'rw',
    isa     => 'ArrayRef[Str]',
    default => sub { [] },
);

=head2 prepare -> Int

This should do any preparation required for the action it's going to take.
This includes things like pathfinding for Explore.

C<prepare> should return an integer from 0 to 100. The higher the integer, the
higher the urgency of the action.

=cut

sub prepare { 0 }

=head2 next_action -> Str

This should return the command that should be sent to NetHack. Note that
C<prepare> is guaranteed to be called before C<next_action> for any given
action. C<next_action> may not be called at all though. C<next_action> will
not be called if C<prepare> returned 0.

=cut

sub next_action {
    my $self = shift;
    my $action = shift @{ $self->commands };
    if (!defined($action) || $action eq '') {
        TAEB->error("Behavior ".$self->name." returned empty next_action.");
    }
    return $action;
}

=head2 name -> Str

The name of the behavior. This should not be overridden.

=cut

sub name {
    my $self = shift;
    my $pkg = blessed($self) || $self;
    $pkg =~ s/^TAEB::AI::Behavior:://;
    return $pkg;
}

=head2 write_elbereth [Bool]

This will do the best it can to write an Elbereth. The optional boolean
specifies whether a depletable method should be used. If it's false, only
methods such as finger-in-dust or Magicbane will be used. If it's true, it
will use the best method it can (starting with wand of fire and going down).

Just call it instead of C<< $self->commands >> and C<< $self->currently >>.

=cut

sub write_elbereth {
    my $self = shift;
    my $best = shift;

    $self->currently("Writing Elbereth.");
    $self->commands(["E-  Elbereth\n"]);
}

1;

