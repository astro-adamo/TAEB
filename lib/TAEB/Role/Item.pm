package TAEB::Role::Item;
use Moose::Role;
use TAEB::OO;
with 'MooseX::Role::Matcher' => {
    -version => 0.03,
    default_match => 'name',
    allow_missing_methods => 1,
};

has created_on => (
    is  => 'rw',
    isa => 'Int',
);

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

    if ($self->does('NetHack::Item::Role::Enchantable')) {
        push @fields, $self->enchantment if defined $self->numeric_enchantment;
    }

    push @fields, $self->name;

    if ($self->does('NetHack::Item::Role::Chargeable')) {
        my $charges = '';

        # recharges
        if (defined($self->recharges)) {
            $charges .= $self->recharges;
        }
        else {
            if ($self->times_recharged) {
                $charges .= $self->times_recharged . '+';
            }
            $charges .= '?';
        }

        $charges .= ':';

        # charges
        if ($self->charges_known) {
            $charges .= $self->charges;
        }
        else {
            $charges .= '?';
            if ($self->charges_spent_this_recharge) {
                $charges .= '-' . $self->charges_spent_this_recharge;
            }
        }

        push @fields, "($charges)";
    }

    if ($self->type eq 'wand') {
        if (!$self->has_identity && $self->tracker->is_nomessage) {
            push @fields, 'nomessage';
        }
    }

    if ($self->can('is_worn') && $self->is_worn) {
        push @fields, '(worn)';
    }

    if ($self->can('is_lit') && $self->is_lit) {
        push @fields, '(lit)';
    }

    if ($self->is_wielded) {
        push @fields, '(wielded)';
    }

    if ($self->can('total_nutrition')) {
        push @fields, '[' . $self->total_nutrition . ']';
    }

    if ($self->cost_each) {
        push @fields, '($' . $self->total_cost . ')';
    }

    if ($self->created_on) {
        push @fields, '<T' . $self->created_on . '>';
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

no Moose::Role;
no TAEB::OO;

1;
