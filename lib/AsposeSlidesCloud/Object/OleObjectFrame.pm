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

package AsposeSlidesCloud::Object::OleObjectFrame;

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
use AsposeSlidesCloud::Object::PictureFill;
use AsposeSlidesCloud::Object::ResourceUri;
use AsposeSlidesCloud::Object::ShapeBase;
use AsposeSlidesCloud::Object::ThreeDFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents OleObjectFrame resource.
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
	$self->{ type } = 'OleObjectFrame';
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


__PACKAGE__->class_documentation({description => 'Represents OleObjectFrame resource.',
                                  class => 'OleObjectFrame',
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
    'is_object_icon' => {
    	datatype => 'boolean',
    	base_name => 'IsObjectIcon',
    	description => 'True if an object is visible as icon.',
    	format => '',
    	read_only => '',
    		},
    'substitute_picture_title' => {
    	datatype => 'string',
    	base_name => 'SubstitutePictureTitle',
    	description => 'The title for OleObject icon.             ',
    	format => '',
    	read_only => '',
    		},
    'substitute_picture_format' => {
    	datatype => 'PictureFill',
    	base_name => 'SubstitutePictureFormat',
    	description => 'OleObject image fill properties.',
    	format => '',
    	read_only => '',
    		},
    'object_name' => {
    	datatype => 'string',
    	base_name => 'ObjectName',
    	description => 'Returns or sets the name of an object.',
    	format => '',
    	read_only => '',
    		},
    'embedded_file_base64_data' => {
    	datatype => 'string',
    	base_name => 'EmbeddedFileBase64Data',
    	description => 'File data of embedded OLE object. ',
    	format => '',
    	read_only => '',
    		},
    'embedded_file_extension' => {
    	datatype => 'string',
    	base_name => 'EmbeddedFileExtension',
    	description => 'File extension for the current embedded OLE object',
    	format => '',
    	read_only => '',
    		},
    'object_prog_id' => {
    	datatype => 'string',
    	base_name => 'ObjectProgId',
    	description => 'ProgID of an object.',
    	format => '',
    	read_only => '',
    		},
    'link_path' => {
    	datatype => 'string',
    	base_name => 'LinkPath',
    	description => 'Full path to a linked file.',
    	format => '',
    	read_only => '',
    		},
    'update_automatic' => {
    	datatype => 'boolean',
    	base_name => 'UpdateAutomatic',
    	description => 'Determines if the linked embedded object is automatically updated when the presentation is opened or printed. Read/write Boolean.',
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
    'is_object_icon' => 'boolean',
    'substitute_picture_title' => 'string',
    'substitute_picture_format' => 'PictureFill',
    'object_name' => 'string',
    'embedded_file_base64_data' => 'string',
    'embedded_file_extension' => 'string',
    'object_prog_id' => 'string',
    'link_path' => 'string',
    'update_automatic' => 'boolean'
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
    'is_object_icon' => 'IsObjectIcon',
    'substitute_picture_title' => 'SubstitutePictureTitle',
    'substitute_picture_format' => 'SubstitutePictureFormat',
    'object_name' => 'ObjectName',
    'embedded_file_base64_data' => 'EmbeddedFileBase64Data',
    'embedded_file_extension' => 'EmbeddedFileExtension',
    'object_prog_id' => 'ObjectProgId',
    'link_path' => 'LinkPath',
    'update_automatic' => 'UpdateAutomatic'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
