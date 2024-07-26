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

BEGIN {push @INC, "../lib"}

use File::Slurp;
use JSON;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::PdfExportOptions;
use AsposeSlidesCloud::Object::Html5ExportOptions;
use AsposeSlidesCloud::Object::ImageExportOptions;
use AsposeSlidesCloud::Object::FontFallbackRule;
use AsposeSlidesCloud::Object::HandoutLayoutingOptions;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'convert post from request' => sub {
    $utils->initialize('convert', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'format' => 'Pdf', 'password' => 'password');
        my $result = $utils->{testSlidesApi}->convert(%params);
        my @slides = ( 2, 4 );
        $params{slides} = \@slides;
        my $result_slides = $utils->{testSlidesApi}->convert(%params);
        ok(length($result) > length($result_slides));
    };
    if ($@) {
        fail("convert raised an exception: $@");
    }
    pass();
};

subtest 'convert put from request' => sub {
    $utils->initialize('convert_and_save', '');
    eval {
        my $out_path = "TestData/test.pdf";
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'format' => 'Pdf', 'out_path' => $out_path, 'password' => 'password');
        $utils->{testSlidesApi}->convert_and_save(%params);
        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("convert_and_save raised an exception: $@");
    }
    pass();
};

subtest 'convert post from storage' => sub {
    $utils->initialize('download_presentation', '');
    eval {
        my %params = ('name' => "test.pptx", 'format' => 'html5', 'password' => 'password', 'folder' => 'TempSlidesSDK');
        $utils->{testSlidesApi}->download_presentation(%params);
    };
    if ($@) {
        fail("download_presentation raised an exception: $@");
    }
    pass();
};

subtest 'convert put from storage' => sub {
    $utils->initialize('save_presentation', '');
    eval {
        my $out_path = "TestData/test.pdf";
        my %params = ('name' => "test.pptx", 'format' => 'pdf', 'out_path' => $out_path, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        $utils->{testSlidesApi}->save_presentation(%params);
        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_presentation raised an exception: $@");
    }
    pass();
};

subtest 'convert with options from request' => sub {
    $utils->initialize('convert', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'format' => 'Pdf', 'password' => 'password');
        my $result = $utils->{testSlidesApi}->convert(%params);
        my $options = AsposeSlidesCloud::Object::PdfExportOptions->new();
        $options->{draw_slides_frame} = 1;
        $params{options} = $options;
        my $result_options = $utils->{testSlidesApi}->convert(%params);
        ok(length($result) != length($result_options));
    };
    if ($@) {
        fail("convert raised an exception: $@");
    }
    pass();
};

subtest 'convert with options from storage' => sub {
    $utils->initialize('download_presentation', '');
    eval {
        my %params = ('name' => "test.pptx", 'format' => 'Png', 'password' => 'password', 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->download_presentation(%params);
        my $options = AsposeSlidesCloud::Object::ImageExportOptions->new();
        $options->{width} = 480;
        $options->{height} = 360;
        $params{options} = $options;
        my $result_options = $utils->{testSlidesApi}->download_presentation(%params);
        ok(length($result) > length($result_options));
    };
    if ($@) {
        fail("download_presentation raised an exception: $@");
    }
    pass();
};

subtest 'convert slide post from request' => sub {
    $utils->initialize('download_slide_online', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'format' => 'Pdf', 'password' => 'password');
        $utils->{testSlidesApi}->download_slide_online(%params);
    };
    if ($@) {
        fail("download_slide_online raised an exception: $@");
    }
    pass();
};

subtest 'convert slide put from request' => sub {
    $utils->initialize('save_slide_online', '');
    eval {
        my $out_path = "TestData/test.pdf";
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'format' => 'Pdf', 'password' => 'password', 'out_path' => $out_path);
        $utils->{testSlidesApi}->save_slide_online(%params);
        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_slide_online raised an exception: $@");
    }
    pass();
};

subtest 'convert slide post from storage' => sub {
    $utils->initialize('download_slide', '');
    eval {
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'format' => 'Pdf', 'password' => 'password', 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->download_slide(%params);
    };
    if ($@) {
        fail("download_slide raised an exception: $@");
    }
    pass();
};

subtest 'convert slide put from storage' => sub {
    $utils->initialize('save_slide', '');
    eval {
        my $out_path = "TestData/test.pdf";
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'format' => 'Pdf', 'password' => 'password', 'folder' => "TempSlidesSDK", 'out_path' => $out_path);
        $utils->{testSlidesApi}->save_slide(%params);

        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_slide raised an exception: $@");
    }
    pass();
};

subtest 'convert slide with options from request' => sub {
    $utils->initialize('download_slide_online', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'format' => 'Pdf', 'password' => 'password');
        my $result = $utils->{testSlidesApi}->download_slide_online(%params);

        my $options = AsposeSlidesCloud::Object::PdfExportOptions->new();
        $options->{draw_slides_frame} = 1;
        $params{options} = $options;
        my $result_options = $utils->{testSlidesApi}->download_slide_online(%params);
        ok(length($result) != length($result_options));
    };
    if ($@) {
        fail("download_slide_online raised an exception: $@");
    }
    pass();
};

subtest 'convert slide with options from storage' => sub {
    $utils->initialize('download_slide', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'format' => 'Pdf', 'password' => 'password', 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->download_slide(%params);

        my $options = AsposeSlidesCloud::Object::PdfExportOptions->new();
        $options->{draw_slides_frame} = 1;
        $params{options} = $options;
        my $result_options = $utils->{testSlidesApi}->download_slide(%params);
        ok(length($result) != length($result_options));
    };
    if ($@) {
        fail("download_slide raised an exception: $@");
    }
    pass();
};

subtest 'convert shape post from request' => sub {
    $utils->initialize('download_shape_online', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'shape_index' => 3, 'format' => 'Png', 'password' => 'password');
        $utils->{testSlidesApi}->download_shape_online(%params);
    };
    if ($@) {
        fail("download_shape_online raised an exception: $@");
    }
    pass();
};

subtest 'convert shape put from request' => sub {
    $utils->initialize('save_shape_online', '');
    eval {
        my $out_path = "TestData/test.pdf";
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'shape_index' => 1, 'format' => 'Png', 'password' => 'password', 'out_path' => $out_path);
        $utils->{testSlidesApi}->save_shape_online(%params);

        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_shape_online raised an exception: $@");
    }
    pass();
};

subtest 'convert shape post from storage' => sub {
    $utils->initialize('download_shape', '');
    eval {
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'format' => 'Png', 'password' => 'password', 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->download_shape(%params);
    };
    if ($@) {
        fail("download_shape raised an exception: $@");
    }
    pass();
};

subtest 'convert sub-shape post from storage' => sub {
    $utils->initialize('download_shape', '');
    eval {
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 4, 'format' => 'Png', 'password' => 'password', 'folder' => "TempSlidesSDK", "sub_shape" => '1');
        $utils->{testSlidesApi}->download_shape(%params);
    };
    if ($@) {
        fail("download_shape raised an exception: $@");
    }
    pass();
};

subtest 'convert shape put from storage' => sub {
    $utils->initialize('save_shape', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);
        
        my $out_path = "TestData/test.pdf";
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'format' => 'Png', 'password' => 'password', 'folder' => "TempSlidesSDK", 'out_path' => $out_path);
        $utils->{testSlidesApi}->save_shape(%params);

        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_shape raised an exception: $@");
    }
    pass();
};

subtest 'convert sub-shape put from storage' => sub {
    $utils->initialize('save_shape', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $out_path = "TestData/test.pdf";
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 4, 'format' => 'Png', 'password' => 'password', 'folder' => "TempSlidesSDK", 'out_path' => $out_path, 'sub_shape' => '1');
        $utils->{testSlidesApi}->save_shape(%params);

        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_shape raised an exception: $@");
    }
    pass();
};

subtest 'convert with font fallback rules' => sub {
    $utils->initialize('download_presentation', '');
    eval
    {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $start_unicode_index = 0x0B80;
        my $end_unicode_index = 0x0BFF;

        my $font_rule1 = AsposeSlidesCloud::Object::FontFallbackRule->new();
        $font_rule1->{range_start_index} = $start_unicode_index;
        $font_rule1->{range_end_index} = $end_unicode_index;
        my @fallback_font_list = ( 'Vijaya');
        $font_rule1->{fallback_font_list} = \@fallback_font_list;

        my $font_rule2 = AsposeSlidesCloud::Object::FontFallbackRule->new();
        $font_rule2->{range_start_index} = $start_unicode_index;
        $font_rule2->{range_end_index} = $end_unicode_index;
        my @fallback_font_list2 = ( 'Segoe UI Emoji', 'Segoe UI Symbol', 'Arial');
        $font_rule2->{fallback_font_list} = \@fallback_font_list2;

        my @font_rules = ($font_rule1, $font_rule2);

        my $export_options = AsposeSlidesCloud::Object::ImageExportOptions -> new();
        $export_options->{font_fallback_rules} = \@font_rules;

        my %params = ('name' => "test.pptx", 'format' => 'Png', 'password' => 'password', 'folder' => "TempSlidesSDK", 'options' => $export_options);
        my $response = $utils->{testSlidesApi}->download_presentation(%params);

        ok(length($response) != 0);
    };
    if ($@) {
        fail("download_presentation raised an exception: $@");
    }
    pass();
};

subtest 'convert with slide layout options' => sub {
    $utils->initialize('download_presentation', '');
    eval
    {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $slides_layout_options = AsposeSlidesCloud::Object::HandoutLayoutingOptions->new();
        $slides_layout_options->{handout} = "Handouts2";
        $slides_layout_options->{print_slide_numbers} = 1;

        my $export_options = AsposeSlidesCloud::Object::PdfExportOptions -> new();
        $export_options->{slides_layout_options} = $slides_layout_options;

        my %params = ('name' => "test.pptx", 'format' => 'Pdf', 'password' => 'password', 'folder' => "TempSlidesSDK", 'options' => $export_options);
        my $response = $utils->{testSlidesApi}->download_presentation(%params);

        ok(length($response) != 0);
    };
    if ($@) {
        fail("download_presentation raised an exception: $@");
    }
    pass();
};

subtest 'convert with custom HTML5 templates' => sub {
    $utils->initialize('download_presentation', '');
    eval
    {
        my $templatesPath = "Html5Templates";
        my $templateFileName = "pictureFrame.html";

        my %create_params = ('path' => $templatesPath);
        $utils->{testSlidesApi}->create_folder(%create_params);

        my %copy_template_params = ('src_path' => "TempTests/".$templateFileName, 'dest_path' => $templatesPath."/".$templateFileName);
        $utils->{testSlidesApi}->copy_file(%copy_template_params);

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $export_options = AsposeSlidesCloud::Object::Html5ExportOptions -> new();
        $export_options->{templates_path} = $templatesPath;
        $export_options->{animate_transitions} = 1;

        my %params = ('name' => "test.pptx", 'format' => 'Html5', 'password' => 'password', 'folder' => "TempSlidesSDK", 'options' => $export_options);
        my $response = $utils->{testSlidesApi}->download_presentation(%params);

        ok(length($response) != 0);
    };
    if ($@) {
        fail("download_presentation raised an exception: $@");
    }
    pass();
};

subtest 'get HTML5 templates' => sub {
    $utils->initialize('download_presentation', '');
    eval
    {
        my $response = $utils->{testSlidesApi}->get_html5_templates();
        ok(length($response) != 0);
    };
    if ($@) {
        fail("get_html5_templates raised an exception: $@");
    }
    pass();
};

done_testing;
