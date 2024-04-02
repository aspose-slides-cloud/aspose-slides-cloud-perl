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

package AsposeSlidesCloud::Object::Table;

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
use AsposeSlidesCloud::Object::ShapeBase;
use AsposeSlidesCloud::Object::TableColumn;
use AsposeSlidesCloud::Object::TableRow;
use AsposeSlidesCloud::Object::ThreeDFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents Table shape resource.
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
	$self->{ type } = 'Table';
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


__PACKAGE__->class_documentation({description => 'Represents Table shape resource.',
                                  class => 'Table',
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
    'is_decorative' => {
    	datatype => 'boolean',
    	base_name => 'IsDecorative',
    	description => 'Gets or sets &#39;Mark as decorative&#39; option.',
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
    'style' => {
    	datatype => 'string',
    	base_name => 'Style',
    	description => 'Builtin table style.',
    	format => '',
    	read_only => '',
    		},
    'rows' => {
    	datatype => 'ARRAY[TableRow]',
    	base_name => 'Rows',
    	description => 'Rows.',
    	format => '',
    	read_only => '',
    		},
    'columns' => {
    	datatype => 'ARRAY[TableColumn]',
    	base_name => 'Columns',
    	description => 'Columns.',
    	format => '',
    	read_only => '',
    		},
    'first_col' => {
    	datatype => 'boolean',
    	base_name => 'FirstCol',
    	description => 'Determines whether the first column of a table has to be drawn with a special formatting.',
    	format => '',
    	read_only => '',
    		},
    'first_row' => {
    	datatype => 'boolean',
    	base_name => 'FirstRow',
    	description => 'Determines whether the first row of a table has to be drawn with a special formatting.',
    	format => '',
    	read_only => '',
    		},
    'horizontal_banding' => {
    	datatype => 'boolean',
    	base_name => 'HorizontalBanding',
    	description => 'Determines whether the even rows has to be drawn with a different formatting.',
    	format => '',
    	read_only => '',
    		},
    'last_col' => {
    	datatype => 'boolean',
    	base_name => 'LastCol',
    	description => 'Determines whether the last column of a table has to be drawn with a special formatting.',
    	format => '',
    	read_only => '',
    		},
    'last_row' => {
    	datatype => 'boolean',
    	base_name => 'LastRow',
    	description => 'Determines whether the last row of a table has to be drawn with a special formatting.',
    	format => '',
    	read_only => '',
    		},
    'right_to_left' => {
    	datatype => 'boolean',
    	base_name => 'RightToLeft',
    	description => 'Determines whether the table has right to left reading order.',
    	format => '',
    	read_only => '',
    		},
    'vertical_banding' => {
    	datatype => 'boolean',
    	base_name => 'VerticalBanding',
    	description => 'Determines whether the even columns has to be drawn with a different formatting.',
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
    'is_decorative' => 'boolean',
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
    'style' => 'string',
    'rows' => 'ARRAY[TableRow]',
    'columns' => 'ARRAY[TableColumn]',
    'first_col' => 'boolean',
    'first_row' => 'boolean',
    'horizontal_banding' => 'boolean',
    'last_col' => 'boolean',
    'last_row' => 'boolean',
    'right_to_left' => 'boolean',
    'vertical_banding' => 'boolean'
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
    'is_decorative' => 'IsDecorative',
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
    'style' => 'Style',
    'rows' => 'Rows',
    'columns' => 'Columns',
    'first_col' => 'FirstCol',
    'first_row' => 'FirstRow',
    'horizontal_banding' => 'HorizontalBanding',
    'last_col' => 'LastCol',
    'last_row' => 'LastRow',
    'right_to_left' => 'RightToLeft',
    'vertical_banding' => 'VerticalBanding'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
