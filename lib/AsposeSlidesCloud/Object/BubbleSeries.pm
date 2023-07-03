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

package AsposeSlidesCloud::Object::BubbleSeries;

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

use AsposeSlidesCloud::Object::BubbleChartDataPoint;
use AsposeSlidesCloud::Object::DataSource;
use AsposeSlidesCloud::Object::EffectFormat;
use AsposeSlidesCloud::Object::FillFormat;
use AsposeSlidesCloud::Object::LineFormat;
use AsposeSlidesCloud::Object::SeriesMarker;
use AsposeSlidesCloud::Object::XYSeries;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#A bubble series.
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
	$self->{ data_point_type } = 'Bubble';
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


__PACKAGE__->class_documentation({description => 'A bubble series.',
                                  class => 'BubbleSeries',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'type' => {
    	datatype => 'string',
    	base_name => 'Type',
    	description => 'Series type.',
    	format => '',
    	read_only => '',
    		},
    'name' => {
    	datatype => 'string',
    	base_name => 'Name',
    	description => 'Series name.',
    	format => '',
    	read_only => '',
    		},
    'data_source_for_series_name' => {
    	datatype => 'DataSource',
    	base_name => 'DataSourceForSeriesName',
    	description => 'Series name data source.',
    	format => '',
    	read_only => '',
    		},
    'is_color_varied' => {
    	datatype => 'boolean',
    	base_name => 'IsColorVaried',
    	description => 'True if each data marker in the series has a different color.',
    	format => '',
    	read_only => '',
    		},
    'inverted_solid_fill_color' => {
    	datatype => 'string',
    	base_name => 'InvertedSolidFillColor',
    	description => 'Invert solid color for the series.',
    	format => '',
    	read_only => '',
    		},
    'smooth' => {
    	datatype => 'boolean',
    	base_name => 'Smooth',
    	description => 'True if curve smoothing is turned on. Applies only to line and scatter connected by lines charts.',
    	format => '',
    	read_only => '',
    		},
    'plot_on_second_axis' => {
    	datatype => 'boolean',
    	base_name => 'PlotOnSecondAxis',
    	description => 'True if the series is plotted on second value axis.',
    	format => '',
    	read_only => '',
    		},
    'order' => {
    	datatype => 'int',
    	base_name => 'Order',
    	description => 'Series order.',
    	format => '',
    	read_only => '',
    		},
    'invert_if_negative' => {
    	datatype => 'boolean',
    	base_name => 'InvertIfNegative',
    	description => 'True if the series shall invert its colors if the value is negative. Applies to bar, column and bubble series.',
    	format => '',
    	read_only => '',
    		},
    'explosion' => {
    	datatype => 'int',
    	base_name => 'Explosion',
    	description => 'The distance of an open pie slice from the center of the pie chart is expressed as a percentage of the pie diameter.',
    	format => '',
    	read_only => '',
    		},
    'marker' => {
    	datatype => 'SeriesMarker',
    	base_name => 'Marker',
    	description => 'Series marker.',
    	format => '',
    	read_only => '',
    		},
    'fill_format' => {
    	datatype => 'FillFormat',
    	base_name => 'FillFormat',
    	description => 'Fill properties set for the series.',
    	format => '',
    	read_only => '',
    		},
    'effect_format' => {
    	datatype => 'EffectFormat',
    	base_name => 'EffectFormat',
    	description => 'Effect properties set for the series.',
    	format => '',
    	read_only => '',
    		},
    'line_format' => {
    	datatype => 'LineFormat',
    	base_name => 'LineFormat',
    	description => 'Line properties set for the series.',
    	format => '',
    	read_only => '',
    		},
    'data_point_type' => {
    	datatype => 'string',
    	base_name => 'DataPointType',
    	description => 'Data point type.',
    	format => '',
    	read_only => '',
    		},
    'number_format_of_y_values' => {
    	datatype => 'string',
    	base_name => 'NumberFormatOfYValues',
    	description => 'The number format for the series y values.',
    	format => '',
    	read_only => '',
    		},
    'number_format_of_x_values' => {
    	datatype => 'string',
    	base_name => 'NumberFormatOfXValues',
    	description => 'The number format for the series x values.',
    	format => '',
    	read_only => '',
    		},
    'data_source_for_x_values' => {
    	datatype => 'DataSource',
    	base_name => 'DataSourceForXValues',
    	description => 'Data source type for X Values.',
    	format => '',
    	read_only => '',
    		},
    'data_source_for_y_values' => {
    	datatype => 'DataSource',
    	base_name => 'DataSourceForYValues',
    	description => 'Data source type for Y Values.',
    	format => '',
    	read_only => '',
    		},
    'data_points' => {
    	datatype => 'ARRAY[BubbleChartDataPoint]',
    	base_name => 'DataPoints',
    	description => 'Gets or sets the values.',
    	format => '',
    	read_only => '',
    		},
    'number_format_of_bubble_sizes' => {
    	datatype => 'string',
    	base_name => 'NumberFormatOfBubbleSizes',
    	description => 'The number format for the series bubble sizes.',
    	format => '',
    	read_only => '',
    		},
    'data_source_for_bubble_size_values' => {
    	datatype => 'DataSource',
    	base_name => 'DataSourceForBubbleSizeValues',
    	description => 'Data source type for Bubble size values.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'type' => 'string',
    'name' => 'string',
    'data_source_for_series_name' => 'DataSource',
    'is_color_varied' => 'boolean',
    'inverted_solid_fill_color' => 'string',
    'smooth' => 'boolean',
    'plot_on_second_axis' => 'boolean',
    'order' => 'int',
    'invert_if_negative' => 'boolean',
    'explosion' => 'int',
    'marker' => 'SeriesMarker',
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat',
    'data_point_type' => 'string',
    'number_format_of_y_values' => 'string',
    'number_format_of_x_values' => 'string',
    'data_source_for_x_values' => 'DataSource',
    'data_source_for_y_values' => 'DataSource',
    'data_points' => 'ARRAY[BubbleChartDataPoint]',
    'number_format_of_bubble_sizes' => 'string',
    'data_source_for_bubble_size_values' => 'DataSource'
} );

__PACKAGE__->attribute_map( {
    'type' => 'Type',
    'name' => 'Name',
    'data_source_for_series_name' => 'DataSourceForSeriesName',
    'is_color_varied' => 'IsColorVaried',
    'inverted_solid_fill_color' => 'InvertedSolidFillColor',
    'smooth' => 'Smooth',
    'plot_on_second_axis' => 'PlotOnSecondAxis',
    'order' => 'Order',
    'invert_if_negative' => 'InvertIfNegative',
    'explosion' => 'Explosion',
    'marker' => 'Marker',
    'fill_format' => 'FillFormat',
    'effect_format' => 'EffectFormat',
    'line_format' => 'LineFormat',
    'data_point_type' => 'DataPointType',
    'number_format_of_y_values' => 'NumberFormatOfYValues',
    'number_format_of_x_values' => 'NumberFormatOfXValues',
    'data_source_for_x_values' => 'DataSourceForXValues',
    'data_source_for_y_values' => 'DataSourceForYValues',
    'data_points' => 'DataPoints',
    'number_format_of_bubble_sizes' => 'NumberFormatOfBubbleSizes',
    'data_source_for_bubble_size_values' => 'DataSourceForBubbleSizeValues'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
