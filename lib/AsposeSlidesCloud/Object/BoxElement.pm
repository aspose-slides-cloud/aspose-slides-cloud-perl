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

package AsposeSlidesCloud::Object::BoxElement;

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

use AsposeSlidesCloud::Object::MathElement;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Box element.
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
	$self->{ type } = 'Box';
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


__PACKAGE__->class_documentation({description => 'Box element.',
                                  class => 'BoxElement',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'type' => {
    	datatype => 'string',
    	base_name => 'Type',
    	description => 'Element type',
    	format => '',
    	read_only => '',
    		},
    'base' => {
    	datatype => 'MathElement',
    	base_name => 'Base',
    	description => 'Base',
    	format => '',
    	read_only => '',
    		},
    'operator_emulator' => {
    	datatype => 'boolean',
    	base_name => 'OperatorEmulator',
    	description => 'Operator emulator',
    	format => '',
    	read_only => '',
    		},
    'no_break' => {
    	datatype => 'boolean',
    	base_name => 'NoBreak',
    	description => 'No break',
    	format => '',
    	read_only => '',
    		},
    'differential' => {
    	datatype => 'boolean',
    	base_name => 'Differential',
    	description => 'Differential',
    	format => '',
    	read_only => '',
    		},
    'alignment_point' => {
    	datatype => 'boolean',
    	base_name => 'AlignmentPoint',
    	description => 'Alignment point',
    	format => '',
    	read_only => '',
    		},
    'explicit_break' => {
    	datatype => 'int',
    	base_name => 'ExplicitBreak',
    	description => 'Explicit break',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'type' => 'string',
    'base' => 'MathElement',
    'operator_emulator' => 'boolean',
    'no_break' => 'boolean',
    'differential' => 'boolean',
    'alignment_point' => 'boolean',
    'explicit_break' => 'int'
} );

__PACKAGE__->attribute_map( {
    'type' => 'Type',
    'base' => 'Base',
    'operator_emulator' => 'OperatorEmulator',
    'no_break' => 'NoBreak',
    'differential' => 'Differential',
    'alignment_point' => 'AlignmentPoint',
    'explicit_break' => 'ExplicitBreak'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
