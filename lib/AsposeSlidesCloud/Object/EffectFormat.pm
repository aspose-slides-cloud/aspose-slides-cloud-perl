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

package AsposeSlidesCloud::Object::EffectFormat;

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

use AsposeSlidesCloud::Object::BlurEffect;
use AsposeSlidesCloud::Object::FillOverlayEffect;
use AsposeSlidesCloud::Object::GlowEffect;
use AsposeSlidesCloud::Object::InnerShadowEffect;
use AsposeSlidesCloud::Object::OuterShadowEffect;
use AsposeSlidesCloud::Object::PresetShadowEffect;
use AsposeSlidesCloud::Object::ReflectionEffect;
use AsposeSlidesCloud::Object::SoftEdgeEffect;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Effect format
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


__PACKAGE__->class_documentation({description => 'Effect format',
                                  class => 'EffectFormat',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'blur' => {
    	datatype => 'BlurEffect',
    	base_name => 'Blur',
    	description => 'blur effect',
    	format => '',
    	read_only => '',
    		},
    'glow' => {
    	datatype => 'GlowEffect',
    	base_name => 'Glow',
    	description => 'glow effect',
    	format => '',
    	read_only => '',
    		},
    'inner_shadow' => {
    	datatype => 'InnerShadowEffect',
    	base_name => 'InnerShadow',
    	description => 'inner shadow effect',
    	format => '',
    	read_only => '',
    		},
    'outer_shadow' => {
    	datatype => 'OuterShadowEffect',
    	base_name => 'OuterShadow',
    	description => 'outer shadow effect',
    	format => '',
    	read_only => '',
    		},
    'preset_shadow' => {
    	datatype => 'PresetShadowEffect',
    	base_name => 'PresetShadow',
    	description => 'preset shadow effect',
    	format => '',
    	read_only => '',
    		},
    'soft_edge' => {
    	datatype => 'SoftEdgeEffect',
    	base_name => 'SoftEdge',
    	description => 'soft edge effect',
    	format => '',
    	read_only => '',
    		},
    'reflection' => {
    	datatype => 'ReflectionEffect',
    	base_name => 'Reflection',
    	description => 'reflection effect',
    	format => '',
    	read_only => '',
    		},
    'fill_overlay' => {
    	datatype => 'FillOverlayEffect',
    	base_name => 'FillOverlay',
    	description => 'fill overlay effect',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'blur' => 'BlurEffect',
    'glow' => 'GlowEffect',
    'inner_shadow' => 'InnerShadowEffect',
    'outer_shadow' => 'OuterShadowEffect',
    'preset_shadow' => 'PresetShadowEffect',
    'soft_edge' => 'SoftEdgeEffect',
    'reflection' => 'ReflectionEffect',
    'fill_overlay' => 'FillOverlayEffect'
} );

__PACKAGE__->attribute_map( {
    'blur' => 'Blur',
    'glow' => 'Glow',
    'inner_shadow' => 'InnerShadow',
    'outer_shadow' => 'OuterShadow',
    'preset_shadow' => 'PresetShadow',
    'soft_edge' => 'SoftEdge',
    'reflection' => 'Reflection',
    'fill_overlay' => 'FillOverlay'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
