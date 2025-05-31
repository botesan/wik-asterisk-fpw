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

package WikipediaFpw::Hash::GDBM;

require 5.005;
use strict;

use WikipediaFpw::Hash::Hash;
use GDBM_File;
use Fcntl;

use vars qw(@ISA);
@ISA = qw(WikipediaFpw::Hash::Hash);

sub open {
    my $self = shift;
    my ($output_file_name) = @_;

    $self->{'file_name'} = "$output_file_name";
    tie(%{$self->{'hash'}}, 'GDBM_File', $self->{'file_name'},
	O_RDWR | O_CREAT | O_TRUNC, 0644);

    return 1;
}

sub close {
    my $self = shift;

    untie($self->{'hash'});
    unlink($self->{'file_name'});

    return 1;
}

1;
