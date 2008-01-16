#!/usr/bin/env perl
package TAEB::Spoilers::Item::Weapon;
use MooseX::Singleton;
extends 'TAEB::Spoilers::Item';

has list => (
    is      => 'ro',
    isa     => 'HashRef',
    lazy    => 1,
    default => sub {
        my $weapons = {
            'Cleaver' => {
                artifact => 1,
                'sdam'   => 'd8+d6+d4',
                'ldam'   => '2d6+2d4',
                'tohit'  => 'd3',
                'hands'  => 2,
                'weight' => 120,
                'type'   => 'iron',
            },
            'Demonbane' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd12',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Dragonbane' => {
                artifact => 1,
                'sdam'   => '2d4',
                'ldam'   => 'd6+1',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Excalibur' => {
                artifact => 1,
                'sdam'   => 'd8+d10',
                'ldam'   => 'd12+d10',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Fire Brand' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd12',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Frost Brand' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd12',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Giantslayer' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd12',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Grayswandir' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd8',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'silver',
            },
            'Grimtooth' => {
                artifact => 1,
                'sdam'   => 'd6+d3',
                'ldam'   => 'd6+d3',
                'tohit'  => 'd2+2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'iron',
            },
            'Longbow of Diana' => {
                artifact => 1,
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
            },
            'Magicbane' => {
                artifact => 1,
                'sdam'   => '2d4',
                'ldam'   => 'd4+d3',
                'tohit'  => 'd5+2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'iron',
            },
            'Mjollnir' => {
                artifact => 1,
                'sdam'   => 'd4+1',
                'ldam'   => 'd4',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 50,
                'type'   => 'iron',
            },
            'Ogresmasher' => {
                artifact => 1,
                'sdam'   => 'd4+1',
                'ldam'   => 'd4',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 50,
                'type'   => 'iron',
            },
            'Orcrist' => {
                artifact => 1,
                'sdam'   => 'd6+d4',
                'ldam'   => 'd6+1',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 70,
                'type'   => 'wood',
            },
            'Sceptre of Might' => {
                artifact => 1,
                'sdam'   => 'd6+1',
                'ldam'   => 'd6',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
            },
            'Snickersnee' => {
                artifact => 1,
                'sdam'   => 'd10+d8',
                'ldam'   => 'd12+d8',
                'tohit'  => '1',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Staff of Aesculapius' => {
                artifact => 1,
                'sdam'   => 'd6',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 40,
                'type'   => 'wood',
            },
            'Sting' => {
                artifact => 1,
                'sdam'   => 'd5',
                'ldam'   => 'd3',
                'tohit'  => 'd5+2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'wood',
            },
            'Stormbringer' => {
                artifact => 1,
                'sdam'   => '2d4+d2',
                'ldam'   => 'd6+d2+1',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Sunsword' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd12',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'The Tsurugi of Muramasa' => {
                artifact => 1,
                'sdam'   => 'd16+d8',
                'ldam'   => '2d8+2d6',
                'tohit'  => '2',
                'hands'  => 2,
                'weight' => 60,
                'type'   => 'metal',
            },
            'Trollsbane' => {
                artifact => 1,
                'sdam'   => '2d4',
                'ldam'   => 'd6+1',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 120,
                'type'   => 'iron',
            },
            'Vorpal Blade' => {
                artifact => 1,
                'sdam'   => 'd8+1',
                'ldam'   => 'd12+1',
                'tohit'  => 'd5',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
            },
            'Werebane' => {
                artifact => 1,
                'sdam'   => 'd8',
                'ldam'   => 'd8',
                'tohit'  => 'd2',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'silver',
            },
            'aklys' => {
                'sdam'   => 'd6',
                'ldam'   => 'd3',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 15,
                'type'   => 'iron',
                appearance => 'thonged club',
                plural => 'aklyses',
            },
            'arrow' => {
                'sdam'   => 'd6',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'iron',
                plural => 'arrows',
            },
            'athame' => {
                'sdam'   => 'd4',
                'ldam'   => 'd3',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'iron',
                plural => 'athames',
            },
            'axe' => {
                'sdam'   => 'd6',
                'ldam'   => 'd4',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 60,
                'type'   => 'iron',
                plural => 'axes',
            },
            'bardiche' => {
                'sdam'   => '2d4',
                'ldam'   => '3d4',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 120,
                'type'   => 'iron',
                appearance => 'long poleaxe',
                plural => 'bardiches',
            },
            'bare-handed combat' => {
                'sdam'    => 'd2',
                'ldam'    => 'd2',
                'tohit'   => '0',
                'type'    => 'none',
                no_plural => 1,
            },
            'battle-axe' => {
                'sdam'   => 'd8+d4',
                'ldam'   => 'd6+2d4',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 120,
                'type'   => 'iron',
                appearance => 'double-headed axe',
                plural => 'battle-axes',
            },
            'bec-de-corbin' => {
                'sdam'   => 'd8',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 100,
                'type'   => 'iron',
                appearance => 'peaked polearm',
                plural => 'bec-de-corbins',
            },
            'bill-guisarme' => {
                'sdam'   => '2d4',
                'ldam'   => 'd10',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 120,
                'type'   => 'iron',
                appearance => 'hooked polearm',
                plural => 'bill-guisarmes',
            },
            'boomerang' => {
                'sdam'   => 'd9',
                'ldam'   => 'd9',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 5,
                'type'   => 'wood',
                plural => 'boomerangs',
            },
            'bow' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                plural => 'bows',
            },
            'broadsword' => {
                'sdam'   => '2d4',
                'ldam'   => 'd6+1',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 70,
                'type'   => 'iron',
                plural => 'broadswords',
            },
            'bullwhip' => {
                'sdam'   => 'd2',
                'ldam'   => '1',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 20,
                'type'   => 'leather',
                plural => 'bullwhips',
            },
            'club' => {
                'sdam'   => 'd6',
                'ldam'   => 'd3',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                plural => 'clubs',
            },
            'crossbow' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 50,
                'type'   => 'wood',
                plural => 'crossbows',
            },
            'crossbow bolt' => {
                'sdam'   => 'd4+1',
                'ldam'   => 'd6+1',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'iron',
                plural => 'crossbow bolts',
            },
            'crysknife' => {
                'sdam'   => 'd10',
                'ldam'   => 'd10',
                'tohit'  => '3',
                'hands'  => 1,
                'weight' => 20,
                'type'   => 'mineral',
                plural => 'crysknives',
            },
            'dagger' => {
                'sdam'   => 'd4',
                'ldam'   => 'd3',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'iron',
                plural => 'daggers',
            },
            'dart' => {
                'sdam'   => 'd3',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'iron',
                plural => 'darts',
            },
            'dwarvish mattock' => {
                'sdam'   => 'd12',
                'ldam'   => 'd8+2d6',
                'tohit'  => '-1',
                'hands'  => 2,
                'weight' => 120,
                'type'   => 'iron',
                appearance => 'broad pick',
                plural => 'dwarvish mattocks',
            },
            'dwarvish short sword' => {
                'sdam'   => 'd7',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                appearance => 'broad short sword',
                plural => 'dwarvish short swords',
            },
            'dwarvish spear' => {
                'sdam'   => 'd8',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 35,
                'type'   => 'iron',
                appearance => 'stout spear',
                plural => 'dwarvish spears',
            },
            'elven arrow' => {
                'sdam'   => 'd7',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'wood',
                appearance => 'runed arrow',
                plural => 'elven arrows',
            },
            'elven bow' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                appearance => 'runed bow',
                plural => 'elven bows',
            },
            'elven broadsword' => {
                'sdam'   => 'd6+d4',
                'ldam'   => 'd6+1',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 70,
                'type'   => 'wood',
                appearance => 'runed broadsword',
                plural => 'elven broadswords',
            },
            'elven dagger' => {
                'sdam'   => 'd5',
                'ldam'   => 'd3',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'wood',
                appearance => 'runed dagger',
                plural => 'elven daggers',
            },
            'elven short sword' => {
                'sdam'   => 'd8',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                appearance => 'runed short sword',
                plural => 'elven short swords',
            },
            'elven spear' => {
                'sdam'   => 'd7',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                appearance => 'runed spear',
                plural => 'elven spears',
            },
            'fauchard' => {
                'sdam'   => 'd6',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 60,
                'type'   => 'iron',
                appearance => 'pole sickle',
                plural => 'fauchards',
            },
            'flail' => {
                'sdam'   => 'd6+1',
                'ldam'   => '2d4',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 15,
                'type'   => 'iron',
                plural => 'flails',
            },
            'flintstone' => {
                'sdam'   => 'd6',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'mineral',
                plural => 'flintstones',
            },
            'glaive' => {
                'sdam'   => 'd6',
                'ldam'   => 'd10',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 75,
                'type'   => 'iron',
                appearance => 'single-edged polearm',
                plural => 'glaives',
            },
            'grappling hook' => {
                'sdam'   => 'd2',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                appearance => 'iron hook',
                plural => 'grappling hooks',
            },
            'guisarme' => {
                'sdam'   => '2d4',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 80,
                'type'   => 'iron',
                appearance => 'pruning polearm',
                plural => 'guisarmes',
            },
            'halberd' => {
                'sdam'   => 'd10',
                'ldam'   => '2d6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 150,
                'type'   => 'iron',
                appearance => 'angled polearm',
                plural => 'halberds',
            },
            'javelin' => {
                'sdam'   => 'd6',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 20,
                'type'   => 'iron',
                appearance => 'throwing spear',
                plural => 'javelins',
            },
            'katana' => {
                'sdam'   => 'd10',
                'ldam'   => 'd12',
                'tohit'  => '1',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
                appearance => 'samurai sword',
                plural => 'katanas',
            },
            'knife' => {
                'sdam'   => 'd3',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 5,
                'type'   => 'iron',
                plural => 'knives',
            },
            'lance' => {
                'sdam'   => 'd6',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 180,
                'type'   => 'iron',
                plural => 'lances',
            },
            'long sword' => {
                'sdam'   => 'd8',
                'ldam'   => 'd12',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
                plural => 'long swords',
            },
            'lucern hammer' => {
                'sdam'   => '2d4',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 150,
                'type'   => 'iron',
                appearance => 'pronged polearm',
                plural => 'lucern hammers',
            },
            'mace' => {
                'sdam'   => 'd6+1',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                plural => 'maces',
            },
            'martial arts' => {
                'sdam'   => 'd4',
                'ldam'   => 'd4',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'none',
                plural => 'martial artses',
            },
            'morning star' => {
                'sdam'   => '2d4',
                'ldam'   => 'd6+1',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 120,
                'type'   => 'iron',
                plural => 'morning stars',
            },
            'orcish arrow' => {
                'sdam'   => 'd5',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'iron',
                appearance => 'crude arrow',
                plural => 'orcish arrows',
            },
            'orcish bow' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                appearance => 'crude bow',
                plural => 'orcish bows',
            },
            'orcish dagger' => {
                'sdam'   => 'd3',
                'ldam'   => 'd3',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 10,
                'type'   => 'iron',
                appearance => 'crude dagger',
                plural => 'orcish daggers',
            },
            'orcish short sword' => {
                'sdam'   => 'd5',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                appearance => 'crude short sword',
                plural => 'orcish short swords',
            },
            'orcish spear' => {
                'sdam'   => 'd5',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                appearance => 'crude spear',
                plural => 'orcish spears',
            },
            'partisan' => {
                'sdam'   => 'd6',
                'ldam'   => 'd6+1',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 80,
                'type'   => 'iron',
                appearance => 'vulgar polearm',
                plural => 'partisans',
            },
            'pick-axe' => {
                'sdam'   => 'd6',
                'ldam'   => 'd3',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 100,
                'type'   => 'iron',
                plural => 'pick-axes',
            },
            'quarterstaff' => {
                'sdam'   => 'd6',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 40,
                'type'   => 'wood',
                appearance => 'staff',
                plural => 'quarterstaves',
            },
            'ranseur' => {
                'sdam'   => '2d4',
                'ldam'   => '2d4',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 50,
                'type'   => 'iron',
                appearance => 'hilted polearm',
                plural => 'ranseurs',
            },
            'rocks/gems/glass' => {
                'sdam'   => 'd3',
                'ldam'   => 'd3',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'vary',
                plural => 'rocks/gems/glasses',
            },
            'rubber hose' => {
                'sdam'   => 'd4',
                'ldam'   => 'd3',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 20,
                'type'   => 'plastic',
                plural => 'rubber hoses',
            },
            'runesword' => {
                'sdam'   => '2d4',
                'ldam'   => 'd6+1',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
                appearance => 'runed broadsword',
                plural => 'runeswords',
            },
            'scalpel' => {
                'sdam'   => 'd3',
                'ldam'   => 'd3',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 5,
                'type'   => 'metal',
                plural => 'scalpels',
            },
            'scimitar' => {
                'sdam'   => 'd8',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'iron',
                appearance => 'curved sword',
                plural => 'scimitars',
            },
            'short sword' => {
                'sdam'   => 'd6',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                plural => 'short swords',
            },
            'shuriken' => {
                'sdam'   => 'd8',
                'ldam'   => 'd6',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'iron',
                appearance => 'throwing star',
                plural => 'shuriken',
            },
            'silver arrow' => {
                'sdam'   => 'd6',
                'ldam'   => 'd6',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'silver',
                plural => 'silver arrows',
            },
            'silver dagger' => {
                'sdam'   => 'd4',
                'ldam'   => 'd3',
                'tohit'  => '2',
                'hands'  => 1,
                'weight' => 12,
                'type'   => 'silver',
                plural => 'silver daggers',
            },
            'silver saber' => {
                'sdam'   => 'd8',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 40,
                'type'   => 'silver',
                plural => 'silver sabers',
            },
            'silver spear' => {
                'sdam'   => 'd6',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 36,
                'type'   => 'silver',
                plural => 'silver spears',
            },
            'sling' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 3,
                'type'   => 'leather',
                plural => 'slings',
            },
            'spear' => {
                'sdam'   => 'd6',
                'ldam'   => 'd8',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'iron',
                plural => 'spears',
            },
            'spetum' => {
                'sdam'   => 'd6+1',
                'ldam'   => '2d6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 50,
                'type'   => 'iron',
                appearance => 'forked polearm',
                plural => 'spetums',
            },
            'stiletto' => {
                'sdam'   => 'd3',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 5,
                'type'   => 'iron',
                plural => 'stilettos',
            },
            'trident' => {
                'sdam'   => 'd6+1',
                'ldam'   => '3d4',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 25,
                'type'   => 'iron',
                plural => 'tridents',
            },
            'tsurugi' => {
                'sdam'   => 'd16',
                'ldam'   => 'd8+2d6',
                'tohit'  => '2',
                'hands'  => 2,
                'weight' => 60,
                'type'   => 'metal',
                appearance => 'long samurai sword',
                plural => 'tsurugis',
            },
            'two-handed sword' => {
                'sdam'   => 'd12',
                'ldam'   => '3d6',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 150,
                'type'   => 'iron',
                plural => 'two-handed swords',
            },
            'unicorn horn' => {
                'sdam'   => 'd12',
                'ldam'   => 'd12',
                'tohit'  => '1',
                'hands'  => 2,
                'weight' => 20,
                'type'   => 'bone',
                plural => 'unicorn horns',
            },
            'voulge' => {
                'sdam'   => '2d4',
                'ldam'   => '2d4',
                'tohit'  => '0',
                'hands'  => 2,
                'weight' => 125,
                'type'   => 'iron',
                appearance => 'pole cleaver',
                plural => 'voulges',
            },
            'war hammer' => {
                'sdam'   => 'd4+1',
                'ldam'   => 'd4',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 50,
                'type'   => 'iron',
                plural => 'war hammers',
            },
            'worm tooth' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 20,
                'type'   => 'none',
                plural => 'worm teeth',
            },
            'ya' => {
                'sdam'   => 'd7',
                'ldam'   => 'd7',
                'tohit'  => '1',
                'hands'  => 1,
                'weight' => 1,
                'type'   => 'metal',
                appearance => 'bamboo arrow',
                plural => 'ya',
            },
            'yumi' => {
                'sdam'   => 'd2',
                'ldam'   => 'd2',
                'tohit'  => '0',
                'hands'  => 1,
                'weight' => 30,
                'type'   => 'wood',
                appearance => 'long bow',
                plural => 'yumis',
            },
        };

        # tag each weapon with its name and appearance
        while (my ($name, $stats) = each %$weapons) {
            $stats->{name} = $name;
            $stats->{appearance} = $name unless $stats->{appearance};
        }

        return $weapons;
    },
);

has constant_appearances => (
    is         => 'ro',
    isa        => 'ArrayRef',
    auto_deref => 1,
    lazy       => 1,
    default    => sub {
        my $self = shift;
        my $appearances = [];
        while (my ($item, $stats) = each %{ $self->list }) {
            push @$appearances, $stats->{appearance};
        }
        return $appearances;
    },
);

sub weapon {
    my $self = shift;
    my $item = shift;

    $item = $item->identity if ref($item);
    return $self->list->{$item};
}

1;

