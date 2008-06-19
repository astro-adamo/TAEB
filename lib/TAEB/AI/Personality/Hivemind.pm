#!/usr/bin/env perl
package TAEB::AI::Personality::Hivemind;
use TAEB::OO;
use TAEB::AI::Personality::Hivemind::Templates;
extends 'TAEB::AI::Personality';

sub next_action {
    my $self = shift;

    {
        $main::request->print(TAEB::AI::Personality::Hivemind::Templates->next_action);
        $main::request->next;
        my $action = $self->fill_action($main::request->param('action'));
        redo if !$action;

        return $action;
    }
}

sub respond {
    $main::request->print(TAEB::AI::Personality::Hivemind::Templates->respond);
    $main::request->next;
    $main::request->param('c');
}

sub fill_action {
    my $self        = shift;
    my $name        = shift;
    my $pkg         = "TAEB::Action::$name";
    my $action_meta = $pkg->meta;
    my %args;

    my @required;
    for my $attr ($action_meta->compute_all_applicable_attributes) {

        # attribute isn't part of initialization
        next if !$attr->provided;

        # specified the argument early
        my $name = $attr->name;
        next if defined($args{$name} = $main::request->param($name));

        # need it, start a new request
        push @required, $attr;
    }

    return $pkg->new(%args) if !@required;

    my ($map, $out) = TAEB::AI::Personality::Hivemind::Templates->action_arguments(@required);
    $main::request->print($out);
    $main::request->next;

    return if $main::request->param('_return_to_command');

    for my $attr (@required) {
        my $name  = $attr->name;
        my $value = $main::request->param($name);
        $value = $map->{$name}->($value) if $map->{$name};
        $args{$name} = $value || $args{$name};
    }

    $pkg->new(%args);
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

