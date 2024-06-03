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

use File::Slurp;
use Archive::Zip;
use JSON;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::Chart;
use AsposeSlidesCloud::Object::ChartTitle;
use AsposeSlidesCloud::Object::Axes;
use AsposeSlidesCloud::Object::Axis;
use AsposeSlidesCloud::Object::OneValueSeries;
use AsposeSlidesCloud::Object::OneValueChartDataPoint;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'nullable properties' => sub {
    my $folder_name = "TempSlidesSDK";
    my $file_name = "test.pptx";
    my $password = "password";
    my $min1  = 44.3;
    my $min2 = 12;
    my $max1 = 104.3;
    my $max2 = 87;
    $utils->initialize('no_method', 'no_property');
    my %copy_params = ('src_path' => 'TempTests/'.$file_name, 'dest_path' => $folder_name.'/'.$file_name);
    $utils->{testSlidesApi}->copy_file(%copy_params);

    my $title = AsposeSlidesCloud::Object::ChartTitle->new();
    $title->{text} = 'MyTitle';
    my $data_point1 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
    $data_point1->{value} = 40.0;
    my $data_point2 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
    $data_point2->{value} = 50.0;
    my @data_points = ($data_point1, $data_point2);
    my $series = AsposeSlidesCloud::Object::OneValueSeries->new();
    $series->{type} = 'ClusteredColumn';
    $series->{data_point_type} = 'OneValue';
    $series->{name} = 'Series1';
    $series->{data_points} = \@data_points;
    my @series_list = ($series);
    my $axis = AsposeSlidesCloud::Object::Axis->new();
    $axis->{is_automatic_min_value} = 0;
    $axis->{min_value} = $min1;
    $axis->{is_automatic_max_value} = 0;
    $axis->{max_value} = $max1;
    my $axes = AsposeSlidesCloud::Object::Axes->new();
    $axes->{horizontal_axis} = $axis;
    my $chart = AsposeSlidesCloud::Object::Chart->new();
    $chart->{chart_type} = 'Line';
    $chart->{width} = 400.0;
    $chart->{height} = 300.0;
    $chart->{has_title} = 1;
    $chart->{title} = $title;
    $chart->{series} = \@series_list;
    $chart->{axes} = $axes;
    my %post_params = ('name' => $file_name, 'folder' => $folder_name, 'password' => $password, 'slide_index' => 1, 'dto' => $chart);
    $utils->{testSlidesApi}->create_shape(%post_params);

    my %get_params = ('name' => $file_name, 'folder' => $folder_name, 'password' => $password, 'slide_index' => 1, 'shape_index' => 5);
    my $result = $utils->{testSlidesApi}->get_shape(%get_params);
    is($result->{axes}->{horizontal_axis}->{min_value}, $min1);
    is($result->{axes}->{horizontal_axis}->{max_value}, $max1);

    $axis = AsposeSlidesCloud::Object::Axis->new();
    $axis->{min_value} = $min2;
    $axes->{horizontal_axis} = $axis;
    $chart = AsposeSlidesCloud::Object::Chart->new();
    $chart->{axes} = $axes;
    my %put_params = ('name' => $file_name, 'folder' => $folder_name, 'password' => $password, 'slide_index' => 1, 'shape_index' => 5, 'dto' => $chart);
    $utils->{testSlidesApi}->update_shape(%put_params);

    $result = $utils->{testSlidesApi}->get_shape(%get_params);
    is($result->{axes}->{horizontal_axis}->{min_value}, $min2);
    is($result->{axes}->{horizontal_axis}->{max_value}, $max1);

    $axis = AsposeSlidesCloud::Object::Axis->new();
    $axis->{max_value} = $max2;
    $axes->{horizontal_axis} = $axis;
    $chart->{axes} = $axes;
    $utils->{testSlidesApi}->update_shape(%put_params);

    $result = $utils->{testSlidesApi}->get_shape(%get_params);
    is($result->{axes}->{horizontal_axis}->{min_value}, $min2);
    is($result->{axes}->{horizontal_axis}->{max_value}, $max2);

    pass();
};

done_testing;
