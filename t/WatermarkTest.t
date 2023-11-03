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
use MIME::Base64;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::PictureFrame;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'watermark text storage' => sub {
    eval {
        my $watermark_text = "watermarkText";
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $get1_result = $utils->{testSlidesApi}->get_shapes(%params);
        my $shape_count = scalar @{$get1_result->{shapes_links}} + 1;

        my %create_params = ('name' => "test.pptx", 'text' => $watermark_text, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_watermark(%create_params);
        my $get2_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get2_result->{shapes_links}}, $shape_count);

        my %get_shape_params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => $shape_count, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shape = $utils->{testSlidesApi}->get_shape(%get_shape_params);
        is($shape->{name}, "watermark");
        is($shape->{text}, $watermark_text);


        my %delete_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_watermark(%delete_params);
        my $get3_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get3_result->{shapes_links}}, $shape_count - 1);
    };
    if ($@) {
        fail("create_watermark raised an exception: $@");
    }
    pass();
};

subtest 'watermark dto storage' => sub {
    eval {
        my $watermark_text = "watermarkText";
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $get1_result = $utils->{testSlidesApi}->get_shapes(%params);
        my $shape_count = scalar @{$get1_result->{shapes_links}} + 1;

        my $watermark = AsposeSlidesCloud::Object::Shape->new();
        $watermark->{text} = $watermark_text;
        my %create_params = ('name' => "test.pptx", 'shape' => $watermark, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_watermark(%create_params);
        my $get2_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get2_result->{shapes_links}}, $shape_count);

        my %get_shape_params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => $shape_count, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shape = $utils->{testSlidesApi}->get_shape(%get_shape_params);
        is($shape->{name}, "watermark");
        is($shape->{text}, $watermark_text);

        my %delete_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_watermark(%delete_params);
        my $get3_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get3_result->{shapes_links}}, $shape_count - 1);
    };
    if ($@) {
        fail("create_watermark raised an exception: $@");
    }
    pass();
};

subtest 'watermark image storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $get1_result = $utils->{testSlidesApi}->get_shapes(%params);
        my $shape_count = scalar @{$get1_result->{shapes_links}} + 1;

        my $source = read_file("TestData/watermark.png", { binmode => ':raw' });
        my %create_params = ('name' => "test.pptx", 'image' => $source, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_image_watermark(%create_params);
        my $get2_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get2_result->{shapes_links}}, $shape_count);

        my %get_shape_params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => $shape_count, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shape = $utils->{testSlidesApi}->get_shape(%get_shape_params);
        is($shape->{name}, "watermark");

        my %delete_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_watermark(%delete_params);
        my $get3_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get3_result->{shapes_links}}, $shape_count - 1);
    };
    if ($@) {
        fail("create_image_watermark raised an exception: $@");
    }
    pass();
};

subtest 'watermark image dto storage' => sub {
    eval {
        my $watermark_name = "myWatermark";
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $get1_result = $utils->{testSlidesApi}->get_shapes(%params);
        my $shape_count = scalar @{$get1_result->{shapes_links}} + 1;

        my $source = read_file("TestData/watermark.png", { binmode => ':raw' });
        my $watermark = AsposeSlidesCloud::Object::PictureFrame->new();
        my $fill_format = AsposeSlidesCloud::Object::PictureFill->new();
        $fill_format->{base64_data} = encode_base64($source);
        $watermark->{fill_format} = $fill_format;
        $watermark->{name} = $watermark_name;
        my %create_params = ('name' => "test.pptx", 'picture_frame' => $watermark, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_image_watermark(%create_params);
        my $get2_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get2_result->{shapes_links}}, $shape_count);

        my %get_shape_params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => $shape_count, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shape = $utils->{testSlidesApi}->get_shape(%get_shape_params);
        is($shape->{name}, $watermark_name);

        my %delete_params = ('name' => "test.pptx", 'shape_name' => $watermark_name, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_watermark(%delete_params);
        my $get3_result = $utils->{testSlidesApi}->get_shapes(%params);
        is(scalar @{$get3_result->{shapes_links}}, $shape_count - 1);
    };
    if ($@) {
        fail("create_image_watermark raised an exception: $@");
    }
    pass();
};

subtest 'watermark text request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });

        my %create_params = ('document' => $source, 'text' => "watermarkText", 'password' => "password");
        my $post_result = $utils->{testSlidesApi}->create_watermark_online(%create_params);
        ok(length($post_result) ne length($source));

        my %delete_params = ('document' => $source, 'password' => "password");
        my $delete_result = $utils->{testSlidesApi}->delete_watermark_online(%delete_params);
        ok(length($post_result) ne length($delete_result));
    };
    if ($@) {
        fail("create_watermark_online raised an exception: $@");
    }
    pass();
};

subtest 'watermark dto request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });

        my $watermark = AsposeSlidesCloud::Object::Shape->new();
        $watermark->{text} = "watermarkText";
        my %create_params = ('document' => $source, 'shape' => $watermark, 'password' => "password");
        my $post_result = $utils->{testSlidesApi}->create_watermark_online(%create_params);
        ok(length($post_result) ne length($source));

        my %delete_params = ('document' => $source, 'password' => "password");
        my $delete_result = $utils->{testSlidesApi}->delete_watermark_online(%delete_params);
        ok(length($post_result) ne length($delete_result));
    };
    if ($@) {
        fail("create_watermark_online raised an exception: $@");
    }
    pass();
};

subtest 'watermark image request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my $watermark = read_file("TestData/watermark.png", { binmode => ':raw' });

        my %create_params = ('document' => $source, 'image' => $watermark, 'password' => "password");
        my $post_result = $utils->{testSlidesApi}->create_image_watermark_online(%create_params);
        ok(length($post_result) ne length($source));

        my %delete_params = ('document' => $source, 'password' => "password");
        my $delete_result = $utils->{testSlidesApi}->delete_watermark_online(%delete_params);
        ok(length($post_result) ne length($delete_result));
    };
    if ($@) {
        fail("create_image_watermark_online raised an exception: $@");
    }
    pass();
};

subtest 'watermark image dto request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my $watermark_source = read_file("TestData/watermark.png", { binmode => ':raw' });

        my $watermark = AsposeSlidesCloud::Object::PictureFrame->new();
        my $fill_format = AsposeSlidesCloud::Object::PictureFill->new();
        $fill_format->{base64_data} = encode_base64($watermark_source);
        $watermark->{fill_format} = $fill_format;
        my %create_params = ('document' => $source, 'picture_frame' => $watermark, 'password' => "password");
        my $post_result = $utils->{testSlidesApi}->create_image_watermark_online(%create_params);
        ok(length($post_result) ne length($source));

        my %delete_params = ('document' => $source, 'password' => "password");
        my $delete_result = $utils->{testSlidesApi}->delete_watermark_online(%delete_params);
        ok(length($post_result) ne length($delete_result));
    };
    if ($@) {
        fail("create_image_watermark_online raised an exception: $@");
    }
    pass();
};

done_testing;
