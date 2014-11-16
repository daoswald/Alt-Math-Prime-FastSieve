## no critic(RCS,VERSION,interpolation)
use strict;
use warnings;

use ExtUtils::MakeMaker;
use lib 'inc';
use Inline::Module::MakeMaker;

WriteMakefile(
  NAME             => 'Math::Prime::FastSieve',
  VERSION_FROM     => 'lib/Math/Prime/FastSieve.pm',
  ABSTRACT_FROM    => 'lib/Math/Prime/FastSieve.pm',
  AUTHOR           => 'David Oswald <davido [@at] cpan [d.o.t] org>',
  LICENSE          => 'artistic',
  MIN_PERL_VERSION => '5.008000',
  PREREQ_PM        => {
    'Inline::CPP'   => '0.68',
    'Inline'        => '0.77',
    'Inline::C'     => '0.65',
  },
  CONFIGURE_REQUIRES => {
    'ExtUtils::MakeMaker' => '7.02',
  },
  BUILD_REQUIRES => {
    'ExtUtils::MakeMaker' => '7.02',
    'Test::More'          => '1.001009',
    'English'             => '0',
  },
  META_MERGE => {
    provides => {
      'Math::Prime::FastSieve' => {
        file    => 'lib/Math/Prime/FastSieve.pm',
        version => '0.01',
      },
    },
  },
);

FixMakefile(
  ILSM   => 'Inline::CPP',
  module => 'Math::Prime::FastSieve',
  inline => 'Math::Prime::FastSieve::Inline'
);
