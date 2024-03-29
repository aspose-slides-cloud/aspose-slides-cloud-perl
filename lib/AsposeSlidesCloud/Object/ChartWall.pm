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

package AsposeSlidesCloud::Object::ChartWall;

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
use AsposeSlidesCloud::Object::LineFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents a chart wall
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

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


__PACKAGE__->class_documentation({description => 'Represents a chart wall',
                                  class => 'ChartWall',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'fill_format' => {
    	datatype => 'FillFormat',
    	base_name => 'FillFormat',
    	description => 'Get or sets the fill format.',
    	format => '',
    	read_only => '',
    		},
    'effect_format' => {
    	datatype => 'EffectFormat',
    	base_name => 'EffectFormat',
    	description => 'Get or sets the effect format.',
    	format => '',
    	read_only => '',
    		},
    'line_format' => {
    	datatype => 'LineFormat',
    	base_name => 'LineFormat',
    	description => 'Get or sets the line format.',
    	format => '',
    	read_only => '',
    		},
    'thickness' => {
    	datatype => 'int',
    	base_name => 'Thickness',
    	description => 'Get or sets wall thickness as a percentage of the largest dimension of the plot volume.',
    	format => '',
    	read_only => '',
    		},
    'picture_type' => {
    	datatype => 'string',
    	base_name => 'PictureType',
    	description => 'Get or sets mode of bar picture filling.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat',
    'thickness' => 'int',
    'picture_type' => 'string'
} );

__PACKAGE__->attribute_map( {
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat',
    'thickness' => 'Thickness',
    'picture_type' => 'PictureType'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
