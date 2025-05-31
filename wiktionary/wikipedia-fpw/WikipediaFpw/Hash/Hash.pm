#                                                         -*- Perl -*-
# Copyright (c) 2009  Kazuhiro Ito
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

package WikipediaFpw::Hash::Hash;

require 5.005;
use strict;


sub new {
    my $type = shift;
    my $new = {
	'hash' => {},
	'file_name' => '',
    };
    return bless($new, $type);
}

sub open {
    return 1;
}

sub close {
    my $self = shift;
    $self->{'hash'} = {};
    return 1;
}

sub get {
  my $self = shift;
  return $self->{'hash'}->{$_[0]};
}

sub put {
  my $self = shift;
  my ($key, $value) = @_;

  $self->{'hash'}->{$key} = $value;
  return 1;
}

1;
