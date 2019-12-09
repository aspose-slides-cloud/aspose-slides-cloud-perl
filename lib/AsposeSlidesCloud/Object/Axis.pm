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

package AsposeSlidesCloud::Object::Axis;

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
use AsposeSlidesCloud::Object::LineFormat;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents a chart axis
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
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize(lcfirst($_subclass), $_element);
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
        my $_instance = eval "AsposeSlidesCloud::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => 'Represents a chart axis',
                                  class => 'Axis',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'is_visible' => {
    	datatype => 'boolean',
    	base_name => 'IsVisible',
    	description => 'True if the axis is visible',
    	format => '',
    	read_only => '',
    		},
    'has_title' => {
    	datatype => 'boolean',
    	base_name => 'HasTitle',
    	description => 'True if the axis has a visible title',
    	format => '',
    	read_only => '',
    		},
    'position' => {
    	datatype => 'string',
    	base_name => 'Position',
    	description => 'Axis position',
    	format => '',
    	read_only => '',
    		},
    'display_unit' => {
    	datatype => 'string',
    	base_name => 'DisplayUnit',
    	description => 'The scaling value of the display units for the value axis',
    	format => '',
    	read_only => '',
    		},
    'base_unit_scale' => {
    	datatype => 'string',
    	base_name => 'BaseUnitScale',
    	description => 'The smallest time unit that is represented on the date axis',
    	format => '',
    	read_only => '',
    		},
    'is_automatic_major_unit' => {
    	datatype => 'boolean',
    	base_name => 'IsAutomaticMajorUnit',
    	description => 'True the major unit of the axis is automatically assigned',
    	format => '',
    	read_only => '',
    		},
    'major_unit' => {
    	datatype => 'double',
    	base_name => 'MajorUnit',
    	description => 'The major units for the date or value axis',
    	format => '',
    	read_only => '',
    		},
    'major_unit_scale' => {
    	datatype => 'string',
    	base_name => 'MajorUnitScale',
    	description => 'The major unit scale for the date axis',
    	format => '',
    	read_only => '',
    		},
    'major_tick_mark' => {
    	datatype => 'string',
    	base_name => 'MajorTickMark',
    	description => 'The type of major tick mark for the specified axis',
    	format => '',
    	read_only => '',
    		},
    'is_automatic_minor_unit' => {
    	datatype => 'boolean',
    	base_name => 'IsAutomaticMinorUnit',
    	description => 'True the minor unit of the axis is automatically assigned',
    	format => '',
    	read_only => '',
    		},
    'minor_unit' => {
    	datatype => 'double',
    	base_name => 'MinorUnit',
    	description => 'The minor units for the date or value axis',
    	format => '',
    	read_only => '',
    		},
    'minor_unit_scale' => {
    	datatype => 'string',
    	base_name => 'MinorUnitScale',
    	description => 'The minor unit scale for the date axis',
    	format => '',
    	read_only => '',
    		},
    'minor_tick_mark' => {
    	datatype => 'string',
    	base_name => 'MinorTickMark',
    	description => 'The type of minor tick mark for the specified axis',
    	format => '',
    	read_only => '',
    		},
    'is_automatic_max_value' => {
    	datatype => 'boolean',
    	base_name => 'IsAutomaticMaxValue',
    	description => 'True if the max value is automatically assigned',
    	format => '',
    	read_only => '',
    		},
    'max_value' => {
    	datatype => 'double',
    	base_name => 'MaxValue',
    	description => 'The maximum value on the value axis',
    	format => '',
    	read_only => '',
    		},
    'is_automatic_min_value' => {
    	datatype => 'boolean',
    	base_name => 'IsAutomaticMinValue',
    	description => 'True if the min value is automatically assigned',
    	format => '',
    	read_only => '',
    		},
    'min_value' => {
    	datatype => 'double',
    	base_name => 'MinValue',
    	description => 'The minimum value on the value axis',
    	format => '',
    	read_only => '',
    		},
    'is_logarithmic' => {
    	datatype => 'boolean',
    	base_name => 'IsLogarithmic',
    	description => 'True if the value axis scale type is logarithmic',
    	format => '',
    	read_only => '',
    		},
    'log_base' => {
    	datatype => 'double',
    	base_name => 'LogBase',
    	description => 'The logarithmic base. Default value is 10',
    	format => '',
    	read_only => '',
    		},
    'category_axis_type' => {
    	datatype => 'string',
    	base_name => 'CategoryAxisType',
    	description => 'The type of the category axis',
    	format => '',
    	read_only => '',
    		},
    'axis_between_categories' => {
    	datatype => 'boolean',
    	base_name => 'AxisBetweenCategories',
    	description => 'True if the value axis crosses the category axis between categories. This property applies only to category axes, and it doesn&#39;t apply to 3-D charts',
    	format => '',
    	read_only => '',
    		},
    'label_offset' => {
    	datatype => 'int',
    	base_name => 'LabelOffset',
    	description => 'The distance of labels from the axis. Applied to category or date axis. Value must be between 0% and 1000%.             ',
    	format => '',
    	read_only => '',
    		},
    'is_plot_order_reversed' => {
    	datatype => 'boolean',
    	base_name => 'IsPlotOrderReversed',
    	description => 'True if MS PowerPoint plots data points from last to first',
    	format => '',
    	read_only => '',
    		},
    'is_number_format_linked_to_source' => {
    	datatype => 'boolean',
    	base_name => 'IsNumberFormatLinkedToSource',
    	description => 'True if the format is linked to source data',
    	format => '',
    	read_only => '',
    		},
    'number_format' => {
    	datatype => 'string',
    	base_name => 'NumberFormat',
    	description => 'the format string for the Axis Labels',
    	format => '',
    	read_only => '',
    		},
    'cross_type' => {
    	datatype => 'string',
    	base_name => 'CrossType',
    	description => 'The CrossType on the specified axis where the other axis crosses',
    	format => '',
    	read_only => '',
    		},
    'cross_at' => {
    	datatype => 'double',
    	base_name => 'CrossAt',
    	description => 'The point on the axis where the perpendicular axis crosses it',
    	format => '',
    	read_only => '',
    		},
    'is_automatic_tick_marks_spacing' => {
    	datatype => 'boolean',
    	base_name => 'IsAutomaticTickMarksSpacing',
    	description => 'True for automatic tick marks spacing value',
    	format => '',
    	read_only => '',
    		},
    'tick_marks_spacing' => {
    	datatype => 'int',
    	base_name => 'TickMarksSpacing',
    	description => 'Specifies how many tick marks shall be skipped before the next one shall be drawn. Applied to category or series axis.',
    	format => '',
    	read_only => '',
    		},
    'is_automatic_tick_label_spacing' => {
    	datatype => 'boolean',
    	base_name => 'IsAutomaticTickLabelSpacing',
    	description => 'True for automatic tick label spacing value',
    	format => '',
    	read_only => '',
    		},
    'tick_label_spacing' => {
    	datatype => 'int',
    	base_name => 'TickLabelSpacing',
    	description => 'Specifies how many tick labels to skip between label that is drawn.',
    	format => '',
    	read_only => '',
    		},
    'tick_label_position' => {
    	datatype => 'string',
    	base_name => 'TickLabelPosition',
    	description => 'The position of tick-mark labels on the specified axis.',
    	format => '',
    	read_only => '',
    		},
    'tick_label_rotation_angle' => {
    	datatype => 'double',
    	base_name => 'TickLabelRotationAngle',
    	description => 'Represents the rotation angle of tick labels.',
    	format => '',
    	read_only => '',
    		},
    'fill_format' => {
    	datatype => 'FillFormat',
    	base_name => 'FillFormat',
    	description => 'Get or sets the fill format.',
    	format => '',
    	read_only => '',
    		},
    'effect_format' => {
    	datatype => 'EffectFormat',
    	base_name => 'EffectFormat',
    	description => 'Get or sets the effect format.',
    	format => '',
    	read_only => '',
    		},
    'line_format' => {
    	datatype => 'LineFormat',
    	base_name => 'LineFormat',
    	description => 'Get or sets the line format.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'is_visible' => 'boolean',
    'has_title' => 'boolean',
    'position' => 'string',
    'display_unit' => 'string',
    'base_unit_scale' => 'string',
    'is_automatic_major_unit' => 'boolean',
    'major_unit' => 'double',
    'major_unit_scale' => 'string',
    'major_tick_mark' => 'string',
    'is_automatic_minor_unit' => 'boolean',
    'minor_unit' => 'double',
    'minor_unit_scale' => 'string',
    'minor_tick_mark' => 'string',
    'is_automatic_max_value' => 'boolean',
    'max_value' => 'double',
    'is_automatic_min_value' => 'boolean',
    'min_value' => 'double',
    'is_logarithmic' => 'boolean',
    'log_base' => 'double',
    'category_axis_type' => 'string',
    'axis_between_categories' => 'boolean',
    'label_offset' => 'int',
    'is_plot_order_reversed' => 'boolean',
    'is_number_format_linked_to_source' => 'boolean',
    'number_format' => 'string',
    'cross_type' => 'string',
    'cross_at' => 'double',
    'is_automatic_tick_marks_spacing' => 'boolean',
    'tick_marks_spacing' => 'int',
    'is_automatic_tick_label_spacing' => 'boolean',
    'tick_label_spacing' => 'int',
    'tick_label_position' => 'string',
    'tick_label_rotation_angle' => 'double',
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat'
} );

__PACKAGE__->attribute_map( {
    'is_visible' => 'IsVisible',
    'has_title' => 'HasTitle',
    'position' => 'Position',
    'display_unit' => 'DisplayUnit',
    'base_unit_scale' => 'BaseUnitScale',
    'is_automatic_major_unit' => 'IsAutomaticMajorUnit',
    'major_unit' => 'MajorUnit',
    'major_unit_scale' => 'MajorUnitScale',
    'major_tick_mark' => 'MajorTickMark',
    'is_automatic_minor_unit' => 'IsAutomaticMinorUnit',
    'minor_unit' => 'MinorUnit',
    'minor_unit_scale' => 'MinorUnitScale',
    'minor_tick_mark' => 'MinorTickMark',
    'is_automatic_max_value' => 'IsAutomaticMaxValue',
    'max_value' => 'MaxValue',
    'is_automatic_min_value' => 'IsAutomaticMinValue',
    'min_value' => 'MinValue',
    'is_logarithmic' => 'IsLogarithmic',
    'log_base' => 'LogBase',
    'category_axis_type' => 'CategoryAxisType',
    'axis_between_categories' => 'AxisBetweenCategories',
    'label_offset' => 'LabelOffset',
    'is_plot_order_reversed' => 'IsPlotOrderReversed',
    'is_number_format_linked_to_source' => 'IsNumberFormatLinkedToSource',
    'number_format' => 'NumberFormat',
    'cross_type' => 'CrossType',
    'cross_at' => 'CrossAt',
    'is_automatic_tick_marks_spacing' => 'IsAutomaticTickMarksSpacing',
    'tick_marks_spacing' => 'TickMarksSpacing',
    'is_automatic_tick_label_spacing' => 'IsAutomaticTickLabelSpacing',
    'tick_label_spacing' => 'TickLabelSpacing',
    'tick_label_position' => 'TickLabelPosition',
    'tick_label_rotation_angle' => 'TickLabelRotationAngle',
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;