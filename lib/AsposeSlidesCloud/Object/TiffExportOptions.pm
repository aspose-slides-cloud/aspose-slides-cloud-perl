=begin comment

Copyright (c) 2019 Aspose Pty Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

=end comment

=cut

package AsposeSlidesCloud::Object::TiffExportOptions;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;

use AsposeSlidesCloud::Object::ExportOptions;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Provides options that control how a presentation is saved in TIFF format.
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

=begin comment

Copyright (c) 2019 Aspose Pty Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

=end comment

=cut
#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	$self->{ format } = 'tiff';
	
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
}

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize(lcfirst($_subclass), $_element);
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } elsif (exists $hash->{lcfirst($_json_attribute)}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{lcfirst($_json_attribute)});
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "AsposeSlidesCloud::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => 'Provides options that control how a presentation is saved in TIFF format.',
                                  class => 'TiffExportOptions',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'default_regular_font' => {
    	datatype => 'string',
    	base_name => 'DefaultRegularFont',
    	description => 'Default regular font for rendering the presentation. ',
    	format => '',
    	read_only => '',
    		},
    'height' => {
    	datatype => 'int',
    	base_name => 'Height',
    	description => 'Gets or sets the height of slides in the output format, e.g. image size, pdf page size etc.',
    	format => '',
    	read_only => '',
    		},
    'width' => {
    	datatype => 'int',
    	base_name => 'Width',
    	description => 'Gets or sets the height of slides in the output format, e.g. image size, pdf page size etc.',
    	format => '',
    	read_only => '',
    		},
    'format' => {
    	datatype => 'string',
    	base_name => 'Format',
    	description => 'Export format.',
    	format => '',
    	read_only => '',
    		},
    'compression' => {
    	datatype => 'string',
    	base_name => 'Compression',
    	description => 'Compression type.',
    	format => '',
    	read_only => '',
    		},
    'dpi_x' => {
    	datatype => 'int',
    	base_name => 'DpiX',
    	description => 'Horizontal resolution, in dots per inch.',
    	format => '',
    	read_only => '',
    		},
    'dpi_y' => {
    	datatype => 'int',
    	base_name => 'DpiY',
    	description => 'Vertical resolution, in dots per inch.',
    	format => '',
    	read_only => '',
    		},
    'show_hidden_slides' => {
    	datatype => 'boolean',
    	base_name => 'ShowHiddenSlides',
    	description => 'Specifies whether the generated document should include hidden slides or not. Default is false. ',
    	format => '',
    	read_only => '',
    		},
    'pixel_format' => {
    	datatype => 'string',
    	base_name => 'PixelFormat',
    	description => 'Specifies the pixel format for the generated images. Read/write ImagePixelFormat.',
    	format => '',
    	read_only => '',
    		},
    'notes_position' => {
    	datatype => 'string',
    	base_name => 'NotesPosition',
    	description => 'Gets or sets the position of the notes on the page.',
    	format => '',
    	read_only => '',
    		},
    'comments_position' => {
    	datatype => 'string',
    	base_name => 'CommentsPosition',
    	description => 'Gets or sets the position of the comments on the page.',
    	format => '',
    	read_only => '',
    		},
    'comments_area_width' => {
    	datatype => 'int',
    	base_name => 'CommentsAreaWidth',
    	description => 'Gets or sets the width of the comment output area in pixels (Applies only if comments are displayed on the right).',
    	format => '',
    	read_only => '',
    		},
    'comments_area_color' => {
    	datatype => 'string',
    	base_name => 'CommentsAreaColor',
    	description => 'Gets or sets the color of comments area (Applies only if comments are displayed on the right).',
    	format => '',
    	read_only => '',
    		},
    'show_comments_by_no_author' => {
    	datatype => 'boolean',
    	base_name => 'ShowCommentsByNoAuthor',
    	description => 'True if comments that have no author are displayed. (Applies only if comments are displayed).',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'default_regular_font' => 'string',
    'height' => 'int',
    'width' => 'int',
    'format' => 'string',
    'compression' => 'string',
    'dpi_x' => 'int',
    'dpi_y' => 'int',
    'show_hidden_slides' => 'boolean',
    'pixel_format' => 'string',
    'notes_position' => 'string',
    'comments_position' => 'string',
    'comments_area_width' => 'int',
    'comments_area_color' => 'string',
    'show_comments_by_no_author' => 'boolean'
} );

__PACKAGE__->attribute_map( {
    'default_regular_font' => 'DefaultRegularFont',
    'height' => 'Height',
    'width' => 'Width',
    'format' => 'Format',
    'compression' => 'Compression',
    'dpi_x' => 'DpiX',
    'dpi_y' => 'DpiY',
    'show_hidden_slides' => 'ShowHiddenSlides',
    'pixel_format' => 'PixelFormat',
    'notes_position' => 'NotesPosition',
    'comments_position' => 'CommentsPosition',
    'comments_area_width' => 'CommentsAreaWidth',
    'comments_area_color' => 'CommentsAreaColor',
    'show_comments_by_no_author' => 'ShowCommentsByNoAuthor'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
