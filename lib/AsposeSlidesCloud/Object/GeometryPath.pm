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

package AsposeSlidesCloud::Object::GeometryPath;

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

use AsposeSlidesCloud::Object::PathSegment;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents GeometryPath of the shape
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


__PACKAGE__->class_documentation({description => 'Represents GeometryPath of the shape',
                                  class => 'GeometryPath',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'fill_mode' => {
    	datatype => 'string',
    	base_name => 'FillMode',
    	description => 'Path fill mode',
    	format => '',
    	read_only => '',
    		},
    'stroke' => {
    	datatype => 'boolean',
    	base_name => 'Stroke',
    	description => 'Stroke',
    	format => '',
    	read_only => '',
    		},
    'path_data' => {
    	datatype => 'ARRAY[PathSegment]',
    	base_name => 'PathData',
    	description => 'List of PathSegmen objects',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'fill_mode' => 'string',
    'stroke' => 'boolean',
    'path_data' => 'ARRAY[PathSegment]'
} );

__PACKAGE__->attribute_map( {
    'fill_mode' => 'FillMode',
    'stroke' => 'Stroke',
    'path_data' => 'PathData'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
