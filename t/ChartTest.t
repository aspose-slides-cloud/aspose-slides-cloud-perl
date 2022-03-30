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
use JSON;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::Object::Chart;
use AsposeSlidesCloud::Object::OneValueSeries;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'chart get' => sub {
    $utils->initialize('get_shape', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->get_shape(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 4);
    };
    if ($@) {
        fail("get_shape raised an exception: $@");
    }
    pass();
};

subtest 'chart create' => sub {
    $utils->initialize('get_shape', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Chart->new();
        $dto->{chart_type} = "ClusteredColumn";
        $dto->{width} = 400;
        $dto->{height} = 300;
        my $series1 = AsposeSlidesCloud::Object::OneValueSeries->new();
        $series1->{name} = "Series1";
        my $point11 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point11->{value} = 40;
        my $point12 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point12->{value} = 50;
        my $point13 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point13->{value} = 70;
        my @points1 = ( $point11, $point12, $point13 );
        $series1->{data_points} = \@points1;
        my $series2 = AsposeSlidesCloud::Object::OneValueSeries->new();
        $series2->{name} = "Series2";
        my $point21 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point21->{value} = 55;
        my $point22 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point22->{value} = 35;
        my $point23 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point23->{value} = 90;
        my @points2 = ( $point21, $point22, $point23 );
        $series2->{data_points} = \@points2;
        my @series = ( $series1, $series2 );
        $dto->{series} = \@series;
        my $category1 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category1->{value} = "Category1";
        my $category2 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category2->{value} = "Category2";
        my $category3 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category3->{value} = "Category3";
        my @categories = ( $category1, $category2, $category3 );
        $dto->{categories} = \@categories;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'dto' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->create_shape(%params);
        is(scalar @{$chart->{series}}, 2);
        is(scalar @{$chart->{categories}}, 3);
    };
    if ($@) {
        fail("get_shape raised an exception: $@");
    }
    pass();
};

subtest 'chart update' => sub {
    $utils->initialize('update_shape', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Chart->new();
        $dto->{chart_type} = "ClusteredColumn";
        $dto->{width} = 400;
        $dto->{height} = 300;
        my $series1 = AsposeSlidesCloud::Object::OneValueSeries->new();
        $series1->{name} = "Series1";
        my $point11 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point11->{value} = 40;
        my $point12 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point12->{value} = 50;
        my $point13 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point13->{value} = 70;
        my @points1 = ( $point11, $point12, $point13 );
        $series1->{data_points} = \@points1;
        my $series2 = AsposeSlidesCloud::Object::OneValueSeries->new();
        $series2->{name} = "Series2";
        my $point21 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point21->{value} = 55;
        my $point22 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point22->{value} = 35;
        my $point23 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point23->{value} = 90;
        my @points2 = ( $point21, $point22, $point23 );
        $series2->{data_points} = \@points2;
        my @series = ( $series1, $series2 );
        $dto->{series} = \@series;
        my $category1 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category1->{value} = "Category1";
        my $category2 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category2->{value} = "Category2";
        my $category3 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category3->{value} = "Category3";
        my @categories = ( $category1, $category2, $category3 );
        $dto->{categories} = \@categories;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'dto' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->update_shape(%params);
        is(scalar @{$chart->{series}}, 2);
        is(scalar @{$chart->{categories}}, 3);
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

subtest 'chart series create' => sub {
    $utils->initialize('create_chart_series', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::OneValueSeries->new();
        $dto->{name} = "Series1";
        my $point1 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point1->{value} = 40;
        my $point2 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point2->{value} = 50;
        my $point3 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point3->{value} = 70;
        my @points = ( $point1, $point2, $point3 );
        $dto->{data_points} = \@points;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'series' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->create_chart_series(%params);
        is(scalar @{$chart->{series}}, 4);
        is(scalar @{$chart->{categories}}, 4);
    };
    if ($@) {
        fail("create_chart_series raised an exception: $@");
    }
    pass();
};

subtest 'chart series update' => sub {
    $utils->initialize('update_chart_series', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::OneValueSeries->new();
        $dto->{name} = "Series3";
        my $point1 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point1->{value} = 40;
        my $point2 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point2->{value} = 50;
        my $point3 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point3->{value} = 14;
        my $point4 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point4->{value} = 70;
        my @points = ( $point1, $point2, $point3, $point4 );
        $dto->{data_points} = \@points;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'series_index' => 2, 'series' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->update_chart_series(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 4);
    };
    if ($@) {
        fail("update_chart_series raised an exception: $@");
    }
    pass();
};

subtest 'chart series delete' => sub {
    $utils->initialize('delete_chart_series', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'series_index' => 2, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->delete_chart_series(%params);
        is(scalar @{$chart->{series}}, 2);
        is(scalar @{$chart->{categories}}, 4);
    };
    if ($@) {
        fail("delete_chart_series raised an exception: $@");
    }
    pass();
};

subtest 'chart category create' => sub {
    $utils->initialize('create_chart_category', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::ChartCategory->new();
        $dto->{value} = "New Category";
        my $point1 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point1->{value} = 40;
        my $point2 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point2->{value} = 50;
        my $point3 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point3->{value} = 14;
        my @points = ( $point1, $point2, $point3 );
        $dto->{data_points} = \@points;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'category' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->create_chart_category(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 5);
        is(scalar @{$chart->{series}[0]{data_points}}, 5);
        is($chart->{series}[0]{data_points}[4]{value}, $dto->{data_points}[0]{value});
    };
    if ($@) {
        fail("create_chart_category raised an exception: $@");
    }
    pass();
};

subtest 'chart category update' => sub {
    $utils->initialize('update_chart_category', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::ChartCategory->new();
        $dto->{value} = "New Category";
        my $point1 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point1->{value} = 40;
        my $point2 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point2->{value} = 50;
        my $point3 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point3->{value} = 14;
        my @points = ( $point1, $point2, $point3 );
        $dto->{data_points} = \@points;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'category_index' => 2, 'category' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->update_chart_category(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 4);
        is(scalar @{$chart->{series}[0]{data_points}}, 4);
        is($chart->{series}[0]{data_points}[1]{value}, $dto->{data_points}[0]{value});
    };
    if ($@) {
        fail("update_chart_category raised an exception: $@");
    }
    pass();
};

subtest 'chart category delete' => sub {
    $utils->initialize('delete_chart_category', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'category_index' => 2, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->delete_chart_category(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 3);
        is(scalar @{$chart->{series}[0]{data_points}}, 3);
    };
    if ($@) {
        fail("delete_chart_category raised an exception: $@");
    }
    pass();
};

subtest 'chart data point create' => sub {
    $utils->initialize('create_chart_data_point', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $dto->{value} = 40;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'series_index' => 2, 'data_point' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        $utils->{api}->create_chart_data_point(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("Must have failed because adding data points only works with Scatter & Bubble charts");
    }
    pass();
};

subtest 'chart data point update' => sub {
    $utils->initialize('update_chart_data_point', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $dto->{value} = 40;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'series_index' => 2, 'point_index' => 2, 'data_point' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->update_chart_data_point(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 4);
        is(scalar @{$chart->{series}[0]{data_points}}, 4);
        is($chart->{series}[1]{data_points}[1]{value}, $dto->{value});
    };
    if ($@) {
        fail("update_chart_data_point raised an exception: $@");
    }
    pass();
};

subtest 'chart data point delete' => sub {
    $utils->initialize('delete_chart_data_point', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'shape_index' => 1, 'series_index' => 2, 'point_index' => 2, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->delete_chart_data_point(%params);
        is(scalar @{$chart->{series}}, 3);
        is(scalar @{$chart->{categories}}, 4);
        is($chart->{series}[1]{data_points}[1], undef);
    };
    if ($@) {
        fail("delete_chart_data_point raised an exception: $@");
    }
    pass();
};

subtest 'chart sunburst' => sub {
    $utils->initialize('create_shape', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Chart->new();
        $dto->{chart_type} = "Sunburst";
        $dto->{width} = 400;
        $dto->{height} = 300;
        my $series1 = AsposeSlidesCloud::Object::OneValueSeries->new();
        $series1->{name} = "Series1";
        my $point1 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point1->{value} = 40;
        my $point2 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point2->{value} = 50;
        my $point3 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point3->{value} = 70;
        my $point4 = AsposeSlidesCloud::Object::OneValueChartDataPoint->new();
        $point4->{value} = 60;
        my @points = ( $point1, $point2, $point3, $point4 );
        $series1->{data_points} = \@points;
        my @series = ( $series1 );
        $dto->{series} = \@series;
        my $category1 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category1->{value} = "Leaf1";
        my @parent_categories1 = ( "Branch1", "Stem1" );
        $category1->{parent_categories} = \@parent_categories1;
        my $category2 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category2->{value} = "Leaf2";
        my @parent_categories2 = ( "Branch1", "Stem1" );
        $category2->{parent_categories} = \@parent_categories2;
        my $category3 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category3->{value} = "Branch2";
        my @parent_categories3 = ( "Stem1" );
        $category3->{parent_categories} = \@parent_categories3;
        my $category4 = AsposeSlidesCloud::Object::ChartCategory->new();
        $category4->{value} = "Stem2";
        my @categories = ( $category1, $category2, $category3, $category4 );
        $dto->{categories} = \@categories;
        my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'dto' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $chart = $utils->{api}->create_shape(%params);
        is(scalar @{$chart->{series}}, 1);
        is(scalar @{$chart->{categories}}, 4);
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

done_testing;
