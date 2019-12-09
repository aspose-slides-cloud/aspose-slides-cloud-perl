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

package AsposeSlidesCloud::Object::VideoFrame;

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

use AsposeSlidesCloud::Object::EffectFormat;
use AsposeSlidesCloud::Object::FillFormat;
use AsposeSlidesCloud::Object::GeometryShape;
use AsposeSlidesCloud::Object::LineFormat;
use AsposeSlidesCloud::Object::ResourceUri;
use AsposeSlidesCloud::Object::ResourceUriElement;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents VideoFrame resource.
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



__PACKAGE__->class_documentation({description => 'Represents VideoFrame resource.',
                                  class => 'VideoFrame',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'self_uri' => {
    	datatype => 'ResourceUri',
    	base_name => 'SelfUri',
    	description => 'Gets or sets the link to this resource.',
    	format => '',
    	read_only => '',
    		},
    'alternate_links' => {
    	datatype => 'ARRAY[ResourceUri]',
    	base_name => 'AlternateLinks',
    	description => 'List of alternate links.',
    	format => '',
    	read_only => '',
    		},
    'name' => {
    	datatype => 'string',
    	base_name => 'Name',
    	description => 'Gets or sets the name.',
    	format => '',
    	read_only => '',
    		},
    'width' => {
    	datatype => 'double',
    	base_name => 'Width',
    	description => 'Gets or sets the width.',
    	format => '',
    	read_only => '',
    		},
    'height' => {
    	datatype => 'double',
    	base_name => 'Height',
    	description => 'Gets or sets the height.',
    	format => '',
    	read_only => '',
    		},
    'alternative_text' => {
    	datatype => 'string',
    	base_name => 'AlternativeText',
    	description => 'Gets or sets the alternative text.',
    	format => '',
    	read_only => '',
    		},
    'alternative_text_title' => {
    	datatype => 'string',
    	base_name => 'AlternativeTextTitle',
    	description => 'The title of alternative text associated with the shape.',
    	format => '',
    	read_only => '',
    		},
    'hidden' => {
    	datatype => 'boolean',
    	base_name => 'Hidden',
    	description => 'Gets or sets a value indicating whether this ShapeBase is hidden.',
    	format => '',
    	read_only => '',
    		},
    'x' => {
    	datatype => 'double',
    	base_name => 'X',
    	description => 'Gets or sets the X',
    	format => '',
    	read_only => '',
    		},
    'y' => {
    	datatype => 'double',
    	base_name => 'Y',
    	description => 'Gets or sets the Y.',
    	format => '',
    	read_only => '',
    		},
    'z_order_position' => {
    	datatype => 'int',
    	base_name => 'ZOrderPosition',
    	description => 'Gets z-order position of shape',
    	format => '',
    	read_only => '',
    		},
    'shapes' => {
    	datatype => 'ResourceUriElement',
    	base_name => 'Shapes',
    	description => 'Gets or sets the link to shapes.',
    	format => '',
    	read_only => '',
    		},
    'fill_format' => {
    	datatype => 'FillFormat',
    	base_name => 'FillFormat',
    	description => 'Gets or sets the fill format.',
    	format => '',
    	read_only => '',
    		},
    'effect_format' => {
    	datatype => 'EffectFormat',
    	base_name => 'EffectFormat',
    	description => 'Gets or sets the effect format.',
    	format => '',
    	read_only => '',
    		},
    'line_format' => {
    	datatype => 'LineFormat',
    	base_name => 'LineFormat',
    	description => 'Gets or sets the line format.',
    	format => '',
    	read_only => '',
    		},
    'type' => {
    	datatype => 'string',
    	base_name => 'Type',
    	description => 'Shape type.',
    	format => '',
    	read_only => '',
    		},
    'shape_type' => {
    	datatype => 'string',
    	base_name => 'ShapeType',
    	description => 'Combined shape type.',
    	format => '',
    	read_only => '',
    		},
    'geometry_shape_type' => {
    	datatype => 'string',
    	base_name => 'GeometryShapeType',
    	description => 'Geometry shape type.',
    	format => '',
    	read_only => '',
    		},
    'full_screen_mode' => {
    	datatype => 'boolean',
    	base_name => 'FullScreenMode',
    	description => 'Determines whether a video is shown in full screen mode.',
    	format => '',
    	read_only => '',
    		},
    'hide_at_showing' => {
    	datatype => 'boolean',
    	base_name => 'HideAtShowing',
    	description => 'Determines whether a VideoFrame is hidden. ',
    	format => '',
    	read_only => '',
    		},
    'play_loop_mode' => {
    	datatype => 'boolean',
    	base_name => 'PlayLoopMode',
    	description => 'Determines whether a video is looped.',
    	format => '',
    	read_only => '',
    		},
    'play_mode' => {
    	datatype => 'string',
    	base_name => 'PlayMode',
    	description => 'Returns or sets the video play mode.  ',
    	format => '',
    	read_only => '',
    		},
    'rewind_video' => {
    	datatype => 'boolean',
    	base_name => 'RewindVideo',
    	description => 'Determines whether a video is automatically rewinded to start as soon as the movie has finished playing',
    	format => '',
    	read_only => '',
    		},
    'volume' => {
    	datatype => 'string',
    	base_name => 'Volume',
    	description => 'Returns or sets the audio volume.',
    	format => '',
    	read_only => '',
    		},
    'base64_data' => {
    	datatype => 'string',
    	base_name => 'Base64Data',
    	description => 'Video data encoded in base64.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'self_uri' => 'ResourceUri',
    'alternate_links' => 'ARRAY[ResourceUri]',
    'name' => 'string',
    'width' => 'double',
    'height' => 'double',
    'alternative_text' => 'string',
    'alternative_text_title' => 'string',
    'hidden' => 'boolean',
    'x' => 'double',
    'y' => 'double',
    'z_order_position' => 'int',
    'shapes' => 'ResourceUriElement',
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat',
    'type' => 'string',
    'shape_type' => 'string',
    'geometry_shape_type' => 'string',
    'full_screen_mode' => 'boolean',
    'hide_at_showing' => 'boolean',
    'play_loop_mode' => 'boolean',
    'play_mode' => 'string',
    'rewind_video' => 'boolean',
    'volume' => 'string',
    'base64_data' => 'string'
} );

__PACKAGE__->attribute_map( {
    'self_uri' => 'SelfUri',
    'alternate_links' => 'AlternateLinks',
    'name' => 'Name',
    'width' => 'Width',
    'height' => 'Height',
    'alternative_text' => 'AlternativeText',
    'alternative_text_title' => 'AlternativeTextTitle',
    'hidden' => 'Hidden',
    'x' => 'X',
    'y' => 'Y',
    'z_order_position' => 'ZOrderPosition',
    'shapes' => 'Shapes',
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat',
    'type' => 'Type',
    'shape_type' => 'ShapeType',
    'geometry_shape_type' => 'GeometryShapeType',
    'full_screen_mode' => 'FullScreenMode',
    'hide_at_showing' => 'HideAtShowing',
    'play_loop_mode' => 'PlayLoopMode',
    'play_mode' => 'PlayMode',
    'rewind_video' => 'RewindVideo',
    'volume' => 'Volume',
    'base64_data' => 'Base64Data'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;