#!/usr/bin/env perl
package TAEB::Spoilers::Item::Artifact;
use MooseX::Singleton;
use TAEB::Spoilers::Item::Weapon;
use TAEB::Spoilers::Item::Tool;

has list => (
    is      => 'ro',
    isa     => 'HashRef',
    lazy    => 1,
    default => sub {
        my $artifacts = { };

        for (qw/Amulet Armor Gem Tool Weapon /) {
            my $list = "TAEB::Spoilers::Item::$_"->list;
            for my $name (keys %$list) {
                my $stats = $list->{$name};
                next unless $stats->{artifact};
                $artifacts->{$name} = $stats;
            }
        }

        return $artifacts;
    },
);

sub artifact {
    my $self = shift;
    my $item = shift;

    $item = $item->identity if ref($item);
    return unless $item;
    return $self->list->{$item};
}

sub seen {
    my $self = shift;
    my $name = shift;
    my $artifact = $self->artifact($name) or do {
        warn "No artifact found for '$name'.";
        return 0;
    };

    if (@_) {
        return $artifact->{seen} = shift;
    }
    return $artifact->{seen};
}

sub BUILD { TAEB->publisher->subscribe(shift); }

sub msg_excalibur {
    my $self = shift;

    $self->seen(Excalibur => 1);
}

no Moose;

1;

