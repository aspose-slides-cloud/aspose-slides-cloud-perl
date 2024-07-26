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

package AsposeSlidesCloud::Object::Html5ExportOptions;

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
use AsposeSlidesCloud::Object::NotesCommentsLayoutingOptions;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Provides options that control how a presentation is saved in Html5 format.
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
	$self->{ format } = 'html5';
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


__PACKAGE__->class_documentation({description => 'Provides options that control how a presentation is saved in Html5 format.',
                                  class => 'Html5ExportOptions',
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
    'animate_transitions' => {
    	datatype => 'boolean',
    	base_name => 'AnimateTransitions',
    	description => 'Gets or sets transitions animation option.',
    	format => '',
    	read_only => '',
    		},
    'animate_shapes' => {
    	datatype => 'boolean',
    	base_name => 'AnimateShapes',
    	description => 'Gets or sets shapes animation option.',
    	format => '',
    	read_only => '',
    		},
    'embed_images' => {
    	datatype => 'boolean',
    	base_name => 'EmbedImages',
    	description => 'Gets or sets embed images option.',
    	format => '',
    	read_only => '',
    		},
    'notes_comments_layouting' => {
    	datatype => 'NotesCommentsLayoutingOptions',
    	base_name => 'NotesCommentsLayouting',
    	description => 'Slides layouting options',
    	format => '',
    	read_only => '',
    		},
    'templates_path' => {
    	datatype => 'string',
    	base_name => 'TemplatesPath',
    	description => 'Path to custom templates',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'default_regular_font' => 'string',
    'gradient_style' => 'string',
    'font_fallback_rules' => 'ARRAY[FontFallbackRule]',
    'font_subst_rules' => 'ARRAY[FontSubstRule]',
    'format' => 'string',
    'animate_transitions' => 'boolean',
    'animate_shapes' => 'boolean',
    'embed_images' => 'boolean',
    'notes_comments_layouting' => 'NotesCommentsLayoutingOptions',
    'templates_path' => 'string'
} );

__PACKAGE__->attribute_map( {
    'default_regular_font' => 'DefaultRegularFont',
    'gradient_style' => 'GradientStyle',
    'font_fallback_rules' => 'FontFallbackRules',
    'font_subst_rules' => 'FontSubstRules',
    'format' => 'Format',
    'animate_transitions' => 'AnimateTransitions',
    'animate_shapes' => 'AnimateShapes',
    'embed_images' => 'EmbedImages',
    'notes_comments_layouting' => 'NotesCommentsLayouting',
    'templates_path' => 'TemplatesPath'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
