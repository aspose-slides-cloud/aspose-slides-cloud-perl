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

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'images get' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $presentation_result = $utils->{api}->get_presentation_images(%params);

        $params{slide_index} = 1;
        my $slide_result = $utils->{api}->get_slide_images(%params);
        ok(scalar @{$slide_result->{list}} < @{$presentation_result->{list}});
    };
    if ($@) {
        fail("get_presentation_images raised an exception: $@");
    }
    pass();
};

subtest 'images download all storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $default_result = $utils->{api}->download_images_default_format(%params);

        $params{format} = "png";
        my $png_result = $utils->{api}->download_images(%params);

        my $defaultFile = 'defaultZip.zip';
	open my $fh, '>>', $defaultFile;
	binmode $fh;
	print $fh $default_result;
	close $fh;

        my $defaultZip = Archive::Zip->new();
        $defaultZip->read($defaultFile);
        my @defaultFiles = $defaultZip->memberNames();

        my $pngFile = 'pngZip.zip';
	open $fh, '>>', $pngFile;
	binmode $fh;
	print $fh $png_result;
	close $fh;

        my $pngZip = Archive::Zip->new();
        $pngZip->read($pngFile);
        my @pngFiles = $pngZip->memberNames();

        is(scalar @defaultFiles, scalar @pngFiles);
    };
    if ($@) {
        fail("download_images raised an exception: $@");
    }
    pass();
};

subtest 'images download all request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'password' => "password");
        my $default_result = $utils->{api}->download_images_default_format_online(%params);

        $params{format} = "png";
        my $png_result = $utils->{api}->download_images_online(%params);

        my $defaultFile = 'defaultZip.zip';
	open my $fh, '>>', $defaultFile;
	binmode $fh;
	print $fh $default_result;
	close $fh;

        my $defaultZip = Archive::Zip->new();
        $defaultZip->read($defaultFile);
        my @defaultFiles = $defaultZip->memberNames();

        my $pngFile = 'pngZip.zip';
	open $fh, '>>', $pngFile;
	binmode $fh;
	print $fh $png_result;
	close $fh;

        my $pngZip = Archive::Zip->new();
        $pngZip->read($pngFile);
        my @pngFiles = $pngZip->memberNames();

        is(scalar @defaultFiles, scalar @pngFiles);
    };
    if ($@) {
        fail("download_images raised an exception: $@");
    }
    pass();
};

subtest 'images download storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('name' => "test.pptx", 'index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $default_result = $utils->{api}->download_image_default_format(%params);

        $params{format} = "png";
        my $png_result = $utils->{api}->download_image(%params);

        ok(not length($default_result) == length($png_result));
    };
    if ($@) {
        fail("download_image raised an exception: $@");
    }
    pass();
};

subtest 'images download request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'index' => 1, 'password' => "password");
        my $default_result = $utils->{api}->download_image_default_format_online(%params);

        $params{format} = "png";
        my $png_result = $utils->{api}->download_image_online(%params);

        ok(not length($default_result) == length($png_result));
    };
    if ($@) {
        fail("download_image raised an exception: $@");
    }
    pass();
};

done_testing;
