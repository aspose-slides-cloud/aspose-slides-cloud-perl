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
use AsposeSlidesCloud::Object::PdfExportOptions;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'split storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result1 = $utils->{api}->split(%params);
        $params{from} = 2;
        $params{to} = 3;
        my $result2 = $utils->{api}->split(%params);
        is(scalar @{$result2->{slides}}, 2);
        ok(scalar @{$result2->{slides}} < scalar @{$result1->{slides}});
        my $url = $result1->{slides}[0]{href};
        my $index = index($url, "/storage/file/") + length("/storage/file/");
        my $path = substr($url, $index, length($url) - $index);

        %params = ('path' => $path);
        my $exists = $utils->{api}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("split raised an exception: $@");
    }
    pass();
};

subtest 'split request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'format' => "png", 'password' => "password");
        my $result1 = $utils->{api}->split_online(%params);
        my $file1 = 'zip1.zip';
	open my $fh, '>>', $file1;
	binmode $fh;
	print $fh $result1;
	close $fh;
        my $zip1 = Archive::Zip->new();
        $zip1->read($file1);
        my @zip1Files = $zip1->memberNames();

        $params{from} = 2;
        $params{to} = 3;
        my $result2 = $utils->{api}->split_online(%params);
        my $file2 = 'zip2.zip';
	open $fh, '>>', $file2;
	binmode $fh;
	print $fh $result2;
	close $fh;
        my $zip2 = Archive::Zip->new();
        $zip2->read($file2);
        my @zip2Files = $zip2->memberNames();

        is(scalar @zip2Files, 2);
        ok(scalar @zip2Files < scalar @zip1Files);
    };
    if ($@) {
        fail("split_online raised an exception: $@");
    }
    pass();
};

subtest 'split request to storage' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'format' => "png", 'password' => "password");
        my $result1 = $utils->{api}->split_and_save_online(%params);

        $params{from} = 2;
        $params{to} = 3;
        my $result2 = $utils->{api}->split_and_save_online(%params);

        is(scalar @{$result2->{slides}}, 2);
        ok(scalar @{$result2->{slides}} < scalar @{$result1->{slides}});
        my $url = $result1->{slides}[0]{href};
        my $index = index($url, "/storage/file/") + length("/storage/file/");
        my $path = substr($url, $index, length($url) - $index);
        %params = ('path' => $path);
        my $exists = $utils->{api}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("split_online raised an exception: $@");
    }
    pass();
};

subtest 'split with options' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $options = AsposeSlidesCloud::Object::PdfExportOptions->new();
        $options->{jpeg_quality} = 50;
        my %params = ('name' => "test.pptx", 'options' => $options, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result1 = $utils->{api}->split(%params);
        my $url = $result1->{slides}[0]{href};
        my $index = index($url, "/storage/file/") + length("/storage/file/");
        my $path = substr($url, $index, length($url) - $index);

        %params = ('path' => $path);
        my $exists = $utils->{api}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("split raised an exception: $@");
    }
    pass();
};

done_testing;
