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

package AsposeSlidesCloud::Object::HtmlExportOptions;

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
use AsposeSlidesCloud::Object::FontFallbackRule;
use AsposeSlidesCloud::Object::FontSubstRule;
use AsposeSlidesCloud::Object::SlidesLayoutOptions;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Provides options that control how a presentation is saved in Html format.
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
	$self->{ format } = 'html';
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


__PACKAGE__->class_documentation({description => 'Provides options that control how a presentation is saved in Html format.',
                                  class => 'HtmlExportOptions',
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
    'delete_embedded_binary_objects' => {
    	datatype => 'boolean',
    	base_name => 'DeleteEmbeddedBinaryObjects',
    	description => 'True to delete delete all embedded binary objects.',
    	format => '',
    	read_only => '',
    		},
    'gradient_style' => {
    	datatype => 'string',
    	base_name => 'GradientStyle',
    	description => 'Default regular font for rendering the presentation. ',
    	format => '',
    	read_only => '',
    		},
    'font_fallback_rules' => {
    	datatype => 'ARRAY[FontFallbackRule]',
    	base_name => 'FontFallbackRules',
    	description => 'Gets of sets list of font fallback rules.',
    	format => '',
    	read_only => '',
    		},
    'font_subst_rules' => {
    	datatype => 'ARRAY[FontSubstRule]',
    	base_name => 'FontSubstRules',
    	description => 'Gets of sets list of font substitution rules.',
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
    'save_as_zip' => {
    	datatype => 'boolean',
    	base_name => 'SaveAsZip',
    	description => 'Get or sets flag for save presentation as zip file',
    	format => '',
    	read_only => '',
    		},
    'sub_directory_name' => {
    	datatype => 'string',
    	base_name => 'SubDirectoryName',
    	description => 'Get or set name of subdirectory in zip-file for store external files',
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
    'svg_responsive_layout' => {
    	datatype => 'boolean',
    	base_name => 'SvgResponsiveLayout',
    	description => 'True to make layout responsive by excluding width and height attributes from svg container.',
    	format => '',
    	read_only => '',
    		},
    'jpeg_quality' => {
    	datatype => 'int',
    	base_name => 'JpegQuality',
    	description => 'Returns or sets a value determining the quality of the JPEG images inside PDF document.',
    	format => '',
    	read_only => '',
    		},
    'pictures_compression' => {
    	datatype => 'string',
    	base_name => 'PicturesCompression',
    	description => 'Represents the pictures compression level',
    	format => '',
    	read_only => '',
    		},
    'delete_pictures_cropped_areas' => {
    	datatype => 'boolean',
    	base_name => 'DeletePicturesCroppedAreas',
    	description => 'A boolean flag indicates if the cropped parts remain as part of the document. If true the cropped  parts will removed, if false they will be serialized in the document (which can possible lead to a  larger file)',
    	format => '',
    	read_only => '',
    		},
    'slides_layout_options' => {
    	datatype => 'SlidesLayoutOptions',
    	base_name => 'SlidesLayoutOptions',
    	description => 'Slides layouting options',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'default_regular_font' => 'string',
    'delete_embedded_binary_objects' => 'boolean',
    'gradient_style' => 'string',
    'font_fallback_rules' => 'ARRAY[FontFallbackRule]',
    'font_subst_rules' => 'ARRAY[FontSubstRule]',
    'format' => 'string',
    'save_as_zip' => 'boolean',
    'sub_directory_name' => 'string',
    'show_hidden_slides' => 'boolean',
    'svg_responsive_layout' => 'boolean',
    'jpeg_quality' => 'int',
    'pictures_compression' => 'string',
    'delete_pictures_cropped_areas' => 'boolean',
    'slides_layout_options' => 'SlidesLayoutOptions'
} );

__PACKAGE__->attribute_map( {
    'default_regular_font' => 'DefaultRegularFont',
    'delete_embedded_binary_objects' => 'DeleteEmbeddedBinaryObjects',
    'gradient_style' => 'GradientStyle',
    'font_fallback_rules' => 'FontFallbackRules',
    'font_subst_rules' => 'FontSubstRules',
    'format' => 'Format',
    'save_as_zip' => 'SaveAsZip',
    'sub_directory_name' => 'SubDirectoryName',
    'show_hidden_slides' => 'ShowHiddenSlides',
    'svg_responsive_layout' => 'SvgResponsiveLayout',
    'jpeg_quality' => 'JpegQuality',
    'pictures_compression' => 'PicturesCompression',
    'delete_pictures_cropped_areas' => 'DeletePicturesCroppedAreas',
    'slides_layout_options' => 'SlidesLayoutOptions'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
