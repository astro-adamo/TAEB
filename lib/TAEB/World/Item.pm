package TAEB::World::Item;
use TAEB::OO;
with 'MooseX::Role::Matcher' => { default_match => 'identity' };

use overload %TAEB::Meta::Overload::default;

has nhi => (
    is       => 'ro',
    isa      => 'NetHack::Item',
    required => 1,
    handles  => [qw/
        appearance artifact buc can_drop clear_container collapse_spoiler_value
        container cost cost_each fork_quantity generic_name hands
        has_appearance has_identity has_tracker identity is_artifact is_blessed
        is_cursed is_evolution_of is_holy is_in_container is_offhand
        is_quivered is_uncursed is_unholy is_wielded ldam maybe_is name
        possibilities quantity raw sdam slot specific_name spoiler
        spoiler_values subtype throw_range tohit tracker type weight
        _set_tracker
    /],
);

sub incorporate_stats_from {
    my $self = shift;
    my $other = shift;
    return $self->nhi->incorporate_stats_from($other->nhi);
}

sub is_auto_picked_up {
    my $self = shift;
    return 0 if !TAEB->autopickup;

    return 1 if $self->match(identity => 'gold piece')
             || $self->match(type => 'wand');

    return 0;
}

my %short_buc = (
    blessed  => 'B',
    cursed   => 'C',
    uncursed => 'UC',
);
sub debug_line {
    my $self = shift;

    my @fields;

    push @fields, $self->quantity . 'x' unless $self->quantity == 1;

    if ($self->buc) {
        push @fields, $self->buc;
    }
    else {
        for (keys %short_buc) {
            my $checker = "is_$_";
            my $value = $self->$checker;
            push @fields, '!' . $short_buc{$_}
                if defined($value)
                && $value == 0;
        }
    }

    if ($self->does('NetHack::Item:::Role::Enchantable')) {
        push @fields, $self->enchantment if $self->numeric_enchantment;
    }

    push @fields, $self->name;

    if ($self->does('NetHack::Item::Role::Chargeable')) {
        push @fields, ('(' .
                      (defined($self->recharges) ? $self->recharges : '?') .
                      ':' . $self->charges . ')') if defined($self->charges);
    }

    if ($self->can('is_worn') && $self->is_worn) {
        push @fields, '(worn)';
    }

    if ($self->is_wielded) {
        push @fields, '(wielded)';
    }

    if ($self->cost_each) {
        push @fields, '($'. $self->cost_each .' each)';
    }

    return join ' ', @fields;
}

around throw_range => sub {
    my $orig = shift;
    my $self = shift;

    $orig->($self,
        strength => TAEB->numeric_strength,
        @_,
    );
};

around match => sub {
    my $orig = shift;
    my $self = shift;

    if (@_ == 1 && !ref($_[0])) {
        return $self->match(artifact   => $_[0])
            || $self->match(identity   => $_[0])
            || $self->match(appearance => $_[0]);
    }

    return $orig->($self, @_);
};

# we try to uphold this API
sub isa {
    my $self = shift;

    return 1 if $_[0] eq 'NetHack::Item';

    $self->SUPER::isa(@_);
};

sub does {
    my $self = shift;

    return 1 if $self->nhi->does(@_);

    $self->SUPER::does(@_);
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

