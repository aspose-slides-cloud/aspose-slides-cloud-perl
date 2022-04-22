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

package AsposeSlidesCloud::Object::Chart;

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

use AsposeSlidesCloud::Object::Axes;
use AsposeSlidesCloud::Object::ChartCategory;
use AsposeSlidesCloud::Object::ChartTitle;
use AsposeSlidesCloud::Object::ChartWall;
use AsposeSlidesCloud::Object::EffectFormat;
use AsposeSlidesCloud::Object::FillFormat;
use AsposeSlidesCloud::Object::Hyperlink;
use AsposeSlidesCloud::Object::Legend;
use AsposeSlidesCloud::Object::LineFormat;
use AsposeSlidesCloud::Object::PlotArea;
use AsposeSlidesCloud::Object::ResourceUri;
use AsposeSlidesCloud::Object::Series;
use AsposeSlidesCloud::Object::ShapeBase;
use AsposeSlidesCloud::Object::ThreeDFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents chart resource
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

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
	$self->{ type } = 'Chart';
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
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

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    my $current_types = {};
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
        $current_types->{$_key} = $_type;
    }
    while ( my ($_key, $_type) = each %{$current_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                if (defined $_element) {
                    push @_array, $self->_deserialize($_subclass, $_element);
                } else {
                    push @_array, undef;
                }
            }
            foreach my $_element (@{$hash->{lcfirst($_json_attribute)}}) {
                if (defined $_element) {
                    push @_array, $self->_deserialize(lcfirst($_subclass), $_element);
                } else {
                    push @_array, undef;
                }
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } elsif (exists $hash->{lcfirst($_json_attribute)}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{lcfirst($_json_attribute)});
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $class = AsposeSlidesCloud::ClassRegistry->get_class_name(ucfirst($type), $data);
        my $_instance = use_module("AsposeSlidesCloud::Object::$class")->new();
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => 'Represents chart resource',
                                  class => 'Chart',
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
    'chart_type' => {
    	datatype => 'string',
    	base_name => 'ChartType',
    	description => 'Gets or sets the type of the chart.',
    	format => '',
    	read_only => '',
    		},
    'show_data_labels_over_maximum' => {
    	datatype => 'boolean',
    	base_name => 'ShowDataLabelsOverMaximum',
    	description => 'True if data labels over the maximum of the chart shall be shown.',
    	format => '',
    	read_only => '',
    		},
    'series' => {
    	datatype => 'ARRAY[Series]',
    	base_name => 'Series',
    	description => 'Gets or sets the series of chart data values.',
    	format => '',
    	read_only => '',
    		},
    'categories' => {
    	datatype => 'ARRAY[ChartCategory]',
    	base_name => 'Categories',
    	description => 'Gets or sets the categories for chart data',
    	format => '',
    	read_only => '',
    		},
    'title' => {
    	datatype => 'ChartTitle',
    	base_name => 'Title',
    	description => 'Gets or sets the title.',
    	format => '',
    	read_only => '',
    		},
    'back_wall' => {
    	datatype => 'ChartWall',
    	base_name => 'BackWall',
    	description => 'Gets or sets the back wall.',
    	format => '',
    	read_only => '',
    		},
    'side_wall' => {
    	datatype => 'ChartWall',
    	base_name => 'SideWall',
    	description => 'Gets or sets the side wall.',
    	format => '',
    	read_only => '',
    		},
    'floor' => {
    	datatype => 'ChartWall',
    	base_name => 'Floor',
    	description => 'Gets or sets the floor.',
    	format => '',
    	read_only => '',
    		},
    'legend' => {
    	datatype => 'Legend',
    	base_name => 'Legend',
    	description => 'Gets or sets the legend.',
    	format => '',
    	read_only => '',
    		},
    'axes' => {
    	datatype => 'Axes',
    	base_name => 'Axes',
    	description => 'Gets or sets the axes.',
    	format => '',
    	read_only => '',
    		},
    'plot_area' => {
    	datatype => 'PlotArea',
    	base_name => 'PlotArea',
    	description => 'Gets or sets the plot area.',
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
    'chart_type' => 'string',
    'show_data_labels_over_maximum' => 'boolean',
    'series' => 'ARRAY[Series]',
    'categories' => 'ARRAY[ChartCategory]',
    'title' => 'ChartTitle',
    'back_wall' => 'ChartWall',
    'side_wall' => 'ChartWall',
    'floor' => 'ChartWall',
    'legend' => 'Legend',
    'axes' => 'Axes',
    'plot_area' => 'PlotArea'
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
    'chart_type' => 'ChartType',
    'show_data_labels_over_maximum' => 'ShowDataLabelsOverMaximum',
    'series' => 'Series',
    'categories' => 'Categories',
    'title' => 'Title',
    'back_wall' => 'BackWall',
    'side_wall' => 'SideWall',
    'floor' => 'Floor',
    'legend' => 'Legend',
    'axes' => 'Axes',
    'plot_area' => 'PlotArea'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
