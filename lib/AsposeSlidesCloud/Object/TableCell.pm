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

package AsposeSlidesCloud::Object::TableCell;

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

use AsposeSlidesCloud::Object::FillFormat;
use AsposeSlidesCloud::Object::LineFormat;
use AsposeSlidesCloud::Object::ResourceUri;
use AsposeSlidesCloud::Object::TextFrameFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents one cell of table.
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


__PACKAGE__->class_documentation({description => 'Represents one cell of table.',
                                  class => 'TableCell',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'text' => {
    	datatype => 'string',
    	base_name => 'Text',
    	description => 'Cell text.',
    	format => '',
    	read_only => '',
    		},
    'row_span' => {
    	datatype => 'int',
    	base_name => 'RowSpan',
    	description => 'The number of rows spanned by a merged cell.',
    	format => '',
    	read_only => '',
    		},
    'col_span' => {
    	datatype => 'int',
    	base_name => 'ColSpan',
    	description => 'The number of columns spanned by a merged cell.',
    	format => '',
    	read_only => '',
    		},
    'margin_top' => {
    	datatype => 'double',
    	base_name => 'MarginTop',
    	description => 'The top margin of the cell.',
    	format => '',
    	read_only => '',
    		},
    'margin_right' => {
    	datatype => 'double',
    	base_name => 'MarginRight',
    	description => 'The right margin of the cell.',
    	format => '',
    	read_only => '',
    		},
    'margin_left' => {
    	datatype => 'double',
    	base_name => 'MarginLeft',
    	description => 'The left margin of the cell.',
    	format => '',
    	read_only => '',
    		},
    'margin_bottom' => {
    	datatype => 'double',
    	base_name => 'MarginBottom',
    	description => 'The bottom margin of the cell.',
    	format => '',
    	read_only => '',
    		},
    'text_anchor_type' => {
    	datatype => 'string',
    	base_name => 'TextAnchorType',
    	description => 'Text anchor type.',
    	format => '',
    	read_only => '',
    		},
    'text_vertical_type' => {
    	datatype => 'string',
    	base_name => 'TextVerticalType',
    	description => 'The type of vertical text.',
    	format => '',
    	read_only => '',
    		},
    'fill_format' => {
    	datatype => 'FillFormat',
    	base_name => 'FillFormat',
    	description => 'Fill properties set of the cell.',
    	format => '',
    	read_only => '',
    		},
    'border_top' => {
    	datatype => 'LineFormat',
    	base_name => 'BorderTop',
    	description => 'Line properties set for the top border of the cell.',
    	format => '',
    	read_only => '',
    		},
    'border_right' => {
    	datatype => 'LineFormat',
    	base_name => 'BorderRight',
    	description => 'Line properties set for the right border of the cell.',
    	format => '',
    	read_only => '',
    		},
    'border_left' => {
    	datatype => 'LineFormat',
    	base_name => 'BorderLeft',
    	description => 'Line properties set for the left border of the cell.',
    	format => '',
    	read_only => '',
    		},
    'border_bottom' => {
    	datatype => 'LineFormat',
    	base_name => 'BorderBottom',
    	description => 'Line properties set for the bottom border of the cell.',
    	format => '',
    	read_only => '',
    		},
    'border_diagonal_up' => {
    	datatype => 'LineFormat',
    	base_name => 'BorderDiagonalUp',
    	description => 'Line properties set for the diagonal up border of the cell.',
    	format => '',
    	read_only => '',
    		},
    'border_diagonal_down' => {
    	datatype => 'LineFormat',
    	base_name => 'BorderDiagonalDown',
    	description => 'Line properties set for the diagonal down border of the cell.',
    	format => '',
    	read_only => '',
    		},
    'column_index' => {
    	datatype => 'int',
    	base_name => 'ColumnIndex',
    	description => 'Cell column index',
    	format => '',
    	read_only => '',
    		},
    'row_index' => {
    	datatype => 'int',
    	base_name => 'RowIndex',
    	description => 'Cell row index',
    	format => '',
    	read_only => '',
    		},
    'text_frame_format' => {
    	datatype => 'TextFrameFormat',
    	base_name => 'TextFrameFormat',
    	description => 'Returns TextFrame&#39;s formatting properties.',
    	format => '',
    	read_only => '',
    		},
    'paragraphs' => {
    	datatype => 'ResourceUri',
    	base_name => 'Paragraphs',
    	description => 'Get or sets list to paragraphs list',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'text' => 'string',
    'row_span' => 'int',
    'col_span' => 'int',
    'margin_top' => 'double',
    'margin_right' => 'double',
    'margin_left' => 'double',
    'margin_bottom' => 'double',
    'text_anchor_type' => 'string',
    'text_vertical_type' => 'string',
    'fill_format' => 'FillFormat',
    'border_top' => 'LineFormat',
    'border_right' => 'LineFormat',
    'border_left' => 'LineFormat',
    'border_bottom' => 'LineFormat',
    'border_diagonal_up' => 'LineFormat',
    'border_diagonal_down' => 'LineFormat',
    'column_index' => 'int',
    'row_index' => 'int',
    'text_frame_format' => 'TextFrameFormat',
    'paragraphs' => 'ResourceUri'
} );

__PACKAGE__->attribute_map( {
    'text' => 'Text',
    'row_span' => 'RowSpan',
    'col_span' => 'ColSpan',
    'margin_top' => 'MarginTop',
    'margin_right' => 'MarginRight',
    'margin_left' => 'MarginLeft',
    'margin_bottom' => 'MarginBottom',
    'text_anchor_type' => 'TextAnchorType',
    'text_vertical_type' => 'TextVerticalType',
    'fill_format' => 'FillFormat',
    'border_top' => 'BorderTop',
    'border_right' => 'BorderRight',
    'border_left' => 'BorderLeft',
    'border_bottom' => 'BorderBottom',
    'border_diagonal_up' => 'BorderDiagonalUp',
    'border_diagonal_down' => 'BorderDiagonalDown',
    'column_index' => 'ColumnIndex',
    'row_index' => 'RowIndex',
    'text_frame_format' => 'TextFrameFormat',
    'paragraphs' => 'Paragraphs'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
