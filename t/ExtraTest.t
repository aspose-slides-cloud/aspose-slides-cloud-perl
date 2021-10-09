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

use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::Object::Chart;
use AsposeSlidesCloud::Object::ChartTitle;
use AsposeSlidesCloud::Object::OneValueSeries;
use AsposeSlidesCloud::Object::OneValueChartDataPoint;
use AsposeSlidesCloud::Object::Axes;
use AsposeSlidesCloud::Object::Axis;
use AsposeSlidesCloud::Object::Pipeline;
use AsposeSlidesCloud::Object::Input;
use AsposeSlidesCloud::Object::RequestInputFile;
use AsposeSlidesCloud::Object::OutputFile;
use AsposeSlidesCloud::Object::Save;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'multipart content' => sub {
    $utils->initialize('post_slides_pipeline', '');

    my $pipeline = AsposeSlidesCloud::Object::Pipeline->new();
    my $input = AsposeSlidesCloud::Object::Input->new();
    my $template_data = AsposeSlidesCloud::Object::RequestInputFile->new();
    $template_data->{index} = 0;
    $input->{template_data} = $template_data;
    my $template = AsposeSlidesCloud::Object::RequestInputFile->new();
    $template->{index} = 1;
    $input->{template} = $template;
    $pipeline->{input} = $input;
    my $task = AsposeSlidesCloud::Object::Save->new();
    $task->{format} = "pptx";
    my $output = AsposeSlidesCloud::Object::OutputFile->new();
    $output->{type} = "Response";
    $task->{output} = $output;
    my @tasks = ($task);
    $pipeline->{tasks} = \@tasks;
    my $file1 = read_file("TestData\\TemplatingCVDataWithBase64.xml", { binmode => ':raw' });
    my $file2 = read_file("TestData\\TemplateCV.pptx", { binmode => ':raw' });
    my @files = ($file1, $file2);
    my %params = ('pipeline' => $pipeline, 'files' => \@files);
    eval {
        my $result = $utils->{api}->pipeline(%params);
    };
    if ($@) {
        fail("post_slides_pipeline raised an exception: $@");
    }
    pass();
};

subtest 'subclass property deserialization' => sub {
    $utils->initialize('get_slide_shape', '');
    my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'shape_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
    eval {
        my $result = $utils->{api}->get_shape(%params);
        is($result->{text}, "1");
    };
    if ($@) {
        fail("post_slides_pipeline raised an exception: $@");
    }
    pass();
};

subtest 'chart initialization' => sub {
    my $chart = AsposeSlidesCloud::Object::Chart->new();
    is($chart->{type}, "Chart");
};

subtest 'timeout' => sub {
    #unstable test
    #$utils->initialize('post_slide_save_as', '');
    #my $config = AsposeSlidesCloud::Configuration->new();
    #my $config_file = decode_json(read_file("testConfig.json"));
    #$config->{base_url} = $config_file->{BaseUrl};
    #$config->{auth_base_url} = $config_file->{AuthBaseUrl};
    #$config->{app_sid} = $config_file->{ClientId};
    #$config->{app_key} = $config_file->{ClientSecret};
    #$config->{debug} = $config_file->{Debug};
    #$config->{timeout} = 1;
    #my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    #my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK', 'format' => 'svg');
    #$api->download_slide(%params);
    pass();
};

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
    $utils->{api}->copy_file(%copy_params);

    my $title = AsposeSlidesCloud::Object::ChartTitle->new();
    $title->{has_title} = 1;
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
    $chart->{title} = $title;
    $chart->{series} = \@series_list;
    $chart->{axes} = $axes;
    my %post_params = ('name' => $file_name, 'folder' => $folder_name, 'password' => $password, 'slide_index' => 1, 'dto' => $chart);
    $utils->{api}->create_shape(%post_params);

    my %get_params = ('name' => $file_name, 'folder' => $folder_name, 'password' => $password, 'slide_index' => 1, 'shape_index' => 5);
    my $result = $utils->{api}->get_shape(%get_params);
    is($result->{axes}->{horizontal_axis}->{min_value}, $min1);
    is($result->{axes}->{horizontal_axis}->{max_value}, $max1);

    $axis = AsposeSlidesCloud::Object::Axis->new();
    $axis->{min_value} = $min2;
    $axes->{horizontal_axis} = $axis;
    $chart = AsposeSlidesCloud::Object::Chart->new();
    $chart->{axes} = $axes;
    my %put_params = ('name' => $file_name, 'folder' => $folder_name, 'password' => $password, 'slide_index' => 1, 'shape_index' => 5, 'dto' => $chart);
    $utils->{api}->update_shape(%put_params);

    $result = $utils->{api}->get_shape(%get_params);
    is($result->{axes}->{horizontal_axis}->{min_value}, $min2);
    is($result->{axes}->{horizontal_axis}->{max_value}, $max1);

    $axis = AsposeSlidesCloud::Object::Axis->new();
    $axis->{max_value} = $max2;
    $axes->{horizontal_axis} = $axis;
    $chart->{axes} = $axes;
    $utils->{api}->update_shape(%put_params);

    $result = $utils->{api}->get_shape(%get_params);
    is($result->{axes}->{horizontal_axis}->{min_value}, $min2);
    is($result->{axes}->{horizontal_axis}->{max_value}, $max2);

    pass();
};

subtest 'good auth' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

subtest 'bad auth' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = 'invalid';
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    eval {
        $api->get_api_info();
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 401);
        } else {
            fail("Strange exception for bad auth");
        }
    } else {
        fail('Must have failed');
    }
    pass();
};

subtest 'good token' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();

    $config->{app_sid} = 'invalid';
    $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

subtest 'bad token' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();

    $config->{access_token} = 'invalid';
    $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

done_testing;