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

package AsposeSlidesCloud::Object::SummaryZoomSection;

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
use AsposeSlidesCloud::Object::Hyperlink;
use AsposeSlidesCloud::Object::LineFormat;
use AsposeSlidesCloud::Object::ResourceUri;
use AsposeSlidesCloud::Object::SectionZoomFrame;
use AsposeSlidesCloud::Object::ThreeDFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents summary zoom section
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
	$self->{ type } = 'SummaryZoomSection';
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


__PACKAGE__->class_documentation({description => 'Represents summary zoom section',
                                  class => 'SummaryZoomSection',
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
    'three_d_format' => {
    	datatype => 'ThreeDFormat',
    	base_name => 'ThreeDFormat',
    	description => 'Gets or sets the 3D format',
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
    'hyperlink_click' => {
    	datatype => 'Hyperlink',
    	base_name => 'HyperlinkClick',
    	description => 'Hyperlink defined for mouse click.',
    	format => '',
    	read_only => '',
    		},
    'hyperlink_mouse_over' => {
    	datatype => 'Hyperlink',
    	base_name => 'HyperlinkMouseOver',
    	description => 'Hyperlink defined for mouse over.',
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
    'image_type' => {
    	datatype => 'string',
    	base_name => 'ImageType',
    	description => 'Image type of a zoom object. ',
    	format => '',
    	read_only => '',
    		},
    'return_to_parent' => {
    	datatype => 'boolean',
    	base_name => 'ReturnToParent',
    	description => 'Navigation behavior in slideshow. ',
    	format => '',
    	read_only => '',
    		},
    'show_background' => {
    	datatype => 'boolean',
    	base_name => 'ShowBackground',
    	description => 'Specifies whether the Zoom will use the background of the destination slide.',
    	format => '',
    	read_only => '',
    		},
    'image' => {
    	datatype => 'ResourceUri',
    	base_name => 'Image',
    	description => 'Internal image link for zoom object',
    	format => '',
    	read_only => '',
    		},
    'transition_duration' => {
    	datatype => 'double',
    	base_name => 'TransitionDuration',
    	description => 'Duration of the transition between Zoom and slide.',
    	format => '',
    	read_only => '',
    		},
    'target_section_index' => {
    	datatype => 'int',
    	base_name => 'TargetSectionIndex',
    	description => 'Index of the target section',
    	format => '',
    	read_only => '',
    		},
    'title' => {
    	datatype => 'string',
    	base_name => 'Title',
    	description => 'Section title',
    	format => '',
    	read_only => '',
    		},
    'description' => {
    	datatype => 'string',
    	base_name => 'Description',
    	description => 'Description of the Summary Zoom Section object. ',
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
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'three_d_format' => 'ThreeDFormat',
    'line_format' => 'LineFormat',
    'hyperlink_click' => 'Hyperlink',
    'hyperlink_mouse_over' => 'Hyperlink',
    'type' => 'string',
    'image_type' => 'string',
    'return_to_parent' => 'boolean',
    'show_background' => 'boolean',
    'image' => 'ResourceUri',
    'transition_duration' => 'double',
    'target_section_index' => 'int',
    'title' => 'string',
    'description' => 'string'
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
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'three_d_format' => 'ThreeDFormat',
    'line_format' => 'LineFormat',
    'hyperlink_click' => 'HyperlinkClick',
    'hyperlink_mouse_over' => 'HyperlinkMouseOver',
    'type' => 'Type',
    'image_type' => 'ImageType',
    'return_to_parent' => 'ReturnToParent',
    'show_background' => 'ShowBackground',
    'image' => 'Image',
    'transition_duration' => 'TransitionDuration',
    'target_section_index' => 'TargetSectionIndex',
    'title' => 'Title',
    'description' => 'Description'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
