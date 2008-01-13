#!/usr/bin/env perl
package TAEB::World::Item;
use Moose;

use overload
    q{""} => sub {
        my $self = shift;
        return sprintf '[%s: %s]', blessed($self), $self->appearance;
    };

has identity => (
    is            => 'rw',
    isa           => 'Str',
    documentation => "Chain mail, long sword, cloak of magic resistance, etc.",
);

enum ItemClass => qw(gold weapon armor food scroll book potion amulet ring wand tool gem unknown);
has class => (
    is            => 'rw',
    isa           => 'ItemClass',
    default       => 'unknown',
    documentation => "Armor, weapon, scroll, etc.",
);

has slot => (
    is  => 'rw',
    isa => 'Str',
);

has quantity => (
    is      => 'rw',
    isa     => 'Int',
    default => 1,
);

enum BUC => qw(blessed uncursed cursed unknown);

has buc => (
    is      => 'rw',
    isa     => 'BUC',
    default => 'unknown',
);

has is_greased => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has is_poisoned => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has erosion1 => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has erosion2 => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has is_fooproof => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has partly_used => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has enchantment => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

enum ItemClass => qw(gold weapon armor food scroll book potion amulet ring wand tool gem);
has class => (
    is            => 'rw',
    isa           => 'ItemClass',
    documentation => "Armor, weapon, scroll, etc.",
);

has visible_description => (
    is            => 'rw',
    isa           => 'Str',
    documentation => "Smoky potion, mud boots, etc.",
);

has identity => (
    is            => 'rw',
    isa           => 'Str',
    documentation => "Chain mail, long sword, cloak of magic resistance, etc.",
);

has generic_name => (
    is            => 'rw',
    isa           => 'Str',
    default       => '',
    documentation => "called X",
);

has specific_name => (
    is            => 'rw',
    isa           => 'Str',
    default       => '',
    documentation => "named X",
);

has is_wielding => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has is_offhand => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has is_quivered => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

enum BUC => qw(blessed uncursed cursed unknown);
has buc => (
    is      => 'rw',
    isa     => 'BUC',
    default => 'unknown',
);

has is_greased => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has cost => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

sub new_item {
    my $self       = shift;
    my $appearance = shift;

    # XXX: there's no way to tell the difference between an item called
    # "foo named bar" and an item called "foo" and named "bar". similarly for
    # an item called "foo (0:1)". so... don't do that!
    my ($slot, $num, $buc, $greased, $poisoned, $ero1, $ero2, $proof, $used,
        $eaten, $dilute, $spe, $item, $call, $name, $recharges, $charges,
        $ncandles, $lit_candelabrum, $lit, $laid, $chain, $quiver, $offhand,
        $wield, $wear, $cost) = $appearance =~
        m{(?:(\w)\s[+-])?\s*                               # inventory slot
          (an?|the|\d+)\s*                                 # number
          (blessed|(?:un)?cursed)?\s*                      # cursedness
          (greased)?\s*                                    # greasy
          (poisoned)?\s*                                   # poisoned
          ((?:(?:very|thoroughly)\ )?(?:burnt|rusty))?\s*  # erosion 1
          ((?:(?:very|thoroughly)\ )?(?:rotted|corroded))?\s* # erosion 2
          (fixed|(?:fire|rust|corrode)proof)?\s*           # fooproof
          (partly\ used)?\s*                               # candles
          (partly\ eaten)?\s*                              # food
          (diluted)?\s*                                    # potions
          ([+-]\d+)?\s*                                    # enchantment
          (?:(?:pair|set)\ of)?\s*                         # gloves and boots
          (.*?)\s*                                         # item name
          (?:called\ (.*?))?\s*                            # non-specific name
          (?:named\ (.*?))?\s*                             # specific name
          (?:\((\d+):(-?\d+)\))?\s*                        # charges
          (?:\((no|[1-7])\ candles?(,\ lit|\ attached)\))?\s* # lit candelabrum
          (\(lit\))?\s*                                    # lit
          (\(laid\ by\ you\))?\s*                          # eggs
          (\(chained\ to\ you\))?\s*                       # iron balls
          (\(in\ quiver\))?\s*                             # quivered
          (\(alternate\ weapon;\ not\ wielded\))?\s*       # off-hand weapon
          (\(weapon.*?\))?\s*                              # wielding
          (\((?:being|embedded|on).*?\))?\s*               # wearing
          (?:\(unpaid,\ (\d+)\ zorkmids?\))?\s*            # shops
          $                                                # anchor the regex
         }x;

    $num = 1        if $num =~ /[at]/;
    $spe =~ s/^\+// if defined $spe;
    $ncandles = 0   if (defined $ncandles && $ncandles =~ /no/);
    $lit = 1        if (defined $lit_candelabrum && $lit_candelabrum =~ /lit/);
    # XXX: depluralization and japanese name mappings should go here

    my $new_item;
    if (!defined $item) {
        TAEB->error("Couldn't find the base item type for '$appearance'!");
        return;
    }

    my $class = TAEB::Knowledge::Item->type_to_class($item);
    if (!defined $class) {
        TAEB->error("Unable to find '$item' in TAEB::Knowledge::Item.");
        return;
    }

    unless ($class eq 'weapon' || $class eq 'armor' || $class eq 'food' ||
            $class eq 'tool') {
        TAEB->error("Items (such as $appearance) of class $class are not yet supported.");
        return;
    }

    my $class_name = uc(substr $class, 0, 1) . (substr $class, 1);
    $new_item = "TAEB::World::Item::$class_name"->new;
    # XXX: once the EliteBot item identification code gets merged
    # in here, this might have to be changed, but it's good enough
    # for now
    $new_item->identity($item);

    $new_item->buc($buc)                   if defined $buc;
    # XXX: this should go into Knowledge::Item::Tool at some point
    my $is_weaptool = $class eq 'tool' && $item =~ /pick-axe|hook|unicorn/;
    if (!defined $buc &&
        ($class eq 'weapon' || $class eq 'wand' || $is_weaptool)) {
        $new_item->buc('uncursed') if defined $spe || defined $charges;
    }

    $new_item->slot($slot)                 if defined $slot;
    $new_item->quantity($num)              if defined $num;
    $new_item->is_greased(1)               if defined $greased;
    $new_item->is_poisoned(1)              if defined $poisoned;
    if (defined $ero1) {
        $new_item->erosion1(1);
        $new_item->erosion1(2)             if $ero1 =~ /very/;
        $new_item->erosion1(3)             if $ero1 =~ /thoroughly/;
    }
    if (defined $ero2) {
        $new_item->erosion2(1);
        $new_item->erosion2(2)             if $ero2 =~ /very/;
        $new_item->erosion2(3)             if $ero2 =~ /thoroughly/;
    }
    $new_item->is_fooproof(1)              if defined $proof;
    $new_item->is_partly_used(1)           if defined $used;
    $new_item->is_partly_eaten(1)          if defined $eaten;
    $new_item->is_diluted(1)               if defined $dilute;
    $new_item->enchantment($spe)           if defined $spe;
    $new_item->recharges($recharges)       if defined $recharges;
    $new_item->charges($charges)           if defined $charges;
    $new_item->candles_attached($ncandles) if defined $ncandles;
    $new_item->generic_name($call)         if defined $call;
    $new_item->specific_name($name)        if defined $name;
    $new_item->is_lit(1)                   if defined $lit;
    $new_item->is_quivered(1)              if defined $quiver;
    $new_item->is_offhand(1)               if defined $offhand;
    $new_item->is_laid_by_you(1)           if defined $laid;
    $new_item->is_chained_to_you(1)        if defined $chain;
    $new_item->is_wielding(1)              if defined $wield;
    $new_item->is_wearing(1)               if defined $wear;
    $new_item->cost($cost)                 if defined $cost;

    return $new_item;
}

1;

