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

package AsposeSlidesCloud::Object::OneValueSeries;

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

use AsposeSlidesCloud::Object::DataSource;
use AsposeSlidesCloud::Object::EffectFormat;
use AsposeSlidesCloud::Object::FillFormat;
use AsposeSlidesCloud::Object::LineFormat;
use AsposeSlidesCloud::Object::OneValueChartDataPoint;
use AsposeSlidesCloud::Object::Series;
use AsposeSlidesCloud::Object::SeriesMarker;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#One value series.
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
	$self->{ data_point_type } = 'OneValue';
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


__PACKAGE__->class_documentation({description => 'One value series.',
                                  class => 'OneValueSeries',
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
    'data_points' => {
    	datatype => 'ARRAY[OneValueChartDataPoint]',
    	base_name => 'DataPoints',
    	description => 'Gets or sets the values.',
    	format => '',
    	read_only => '',
    		},
    'number_format_of_values' => {
    	datatype => 'string',
    	base_name => 'NumberFormatOfValues',
    	description => 'The number format for the series values.',
    	format => '',
    	read_only => '',
    		},
    'data_source_for_values' => {
    	datatype => 'DataSource',
    	base_name => 'DataSourceForValues',
    	description => 'Data source type for values.',
    	format => '',
    	read_only => '',
    		},
    'show_connector_lines' => {
    	datatype => 'boolean',
    	base_name => 'ShowConnectorLines',
    	description => 'True if inner points are shown. Applied to Waterfall series only.',
    	format => '',
    	read_only => '',
    		},
    'quartile_method' => {
    	datatype => 'string',
    	base_name => 'QuartileMethod',
    	description => 'Quartile method. Applied to BoxAndWhisker series only.',
    	format => '',
    	read_only => '',
    		},
    'show_inner_points' => {
    	datatype => 'boolean',
    	base_name => 'ShowInnerPoints',
    	description => 'True if inner points are shown. Applied to BoxAndWhisker series only.',
    	format => '',
    	read_only => '',
    		},
    'show_mean_line' => {
    	datatype => 'boolean',
    	base_name => 'ShowMeanLine',
    	description => 'True if mean line is shown. Applied to BoxAndWhisker series only.',
    	format => '',
    	read_only => '',
    		},
    'show_mean_markers' => {
    	datatype => 'boolean',
    	base_name => 'ShowMeanMarkers',
    	description => 'True if mean markers are shown. Applied to BoxAndWhisker series only.',
    	format => '',
    	read_only => '',
    		},
    'show_outlier_points' => {
    	datatype => 'boolean',
    	base_name => 'ShowOutlierPoints',
    	description => 'True if outlier points are shown. Applied to BoxAndWhisker series only.',
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
    'data_points' => 'ARRAY[OneValueChartDataPoint]',
    'number_format_of_values' => 'string',
    'data_source_for_values' => 'DataSource',
    'show_connector_lines' => 'boolean',
    'quartile_method' => 'string',
    'show_inner_points' => 'boolean',
    'show_mean_line' => 'boolean',
    'show_mean_markers' => 'boolean',
    'show_outlier_points' => 'boolean'
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
    'data_points' => 'DataPoints',
    'number_format_of_values' => 'NumberFormatOfValues',
    'data_source_for_values' => 'DataSourceForValues',
    'show_connector_lines' => 'ShowConnectorLines',
    'quartile_method' => 'QuartileMethod',
    'show_inner_points' => 'ShowInnerPoints',
    'show_mean_line' => 'ShowMeanLine',
    'show_mean_markers' => 'ShowMeanMarkers',
    'show_outlier_points' => 'ShowOutlierPoints'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
