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
use Archive::Zip;
use JSON;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::PresentationsMergeRequest;
use AsposeSlidesCloud::Object::OrderedMergeRequest;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'merge storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        %copy_params = ('src_path' => "TempTests/test-unprotected.pptx", 'dest_path' => "TempSlidesSDK/test-unprotected.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        %copy_params = ('src_path' => "TempTests/test.pdf", 'dest_path' => "TempSlidesSDK/test.pdf");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $request = AsposeSlidesCloud::Object::PresentationsMergeRequest->new();
        my @paths = ( "TempSlidesSDK/test-unprotected.pptx", "TempSlidesSDK/test.pdf" );
        $request->{presentation_paths} = \@paths;
        my %params = ('name' => "test.pptx", 'request' => $request, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->merge(%params);
    };
    if ($@) {
        fail("merge raised an exception: $@");
    }
    pass();
};

subtest 'merge ordered storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        %copy_params = ('src_path' => "TempTests/test-unprotected.pptx", 'dest_path' => "TempSlidesSDK/test-unprotected.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $request = AsposeSlidesCloud::Object::OrderedMergeRequest->new();
        my $presentation = AsposeSlidesCloud::Object::PresentationToMerge->new();
        $presentation->{path} = "TempSlidesSDK/test-unprotected.pptx";
        my @slides = ( 2, 1 );
        $presentation->{slides} = \@slides;
        my @presentations = ( $presentation );
        $request->{presentations} = \@presentations;
        my %params = ('name' => "test.pptx", 'request' => $request, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->ordered_merge(%params);
    };
    if ($@) {
        fail("ordered_merge raised an exception: $@");
    }
    pass();
};

subtest 'merge request' => sub {
    eval {
        my $source1 = read_file("TestData/TemplateCV.pptx", { binmode => ':raw' });
        my $source2 = read_file("TestData/test-unprotected.pptx", { binmode => ':raw' });
        my @files = ( $source1, $source2 );
        my %params = ('files' => \@files);
        $utils->{testSlidesApi}->merge_online(%params);
    };
    if ($@) {
        fail("merge_online raised an exception: $@");
    }
    pass();
};

subtest 'merge request save' => sub {
    eval {
        my $out_path = "TestData/out.pptx";
        my $source1 = read_file("TestData/TemplateCV.pptx", { binmode => ':raw' });
        my $source2 = read_file("TestData/test-unprotected.pptx", { binmode => ':raw' });
        my @files = ( $source1, $source2 );
        my %params = ('files' => \@files, 'out_path' => $out_path);
        $utils->{testSlidesApi}->merge_and_save_online(%params);

        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("merge_and_save_online raised an exception: $@");
    }
    pass();
};

subtest 'merge ordered request' => sub {
    eval {
        my $out_path = "TestData/out.pptx";
        my $source1 = read_file("TestData/test.pptx", { binmode => ':raw' });
        my $source2 = read_file("TestData/test-unprotected.pptx", { binmode => ':raw' });
        my @files = ( $source1, $source2 );
        my $request = AsposeSlidesCloud::Object::OrderedMergeRequest->new();
        my $presentation1 = AsposeSlidesCloud::Object::PresentationToMerge->new();
        $presentation1->{path} = "file1";
        $presentation1->{password} = "password";
        my $presentation2 = AsposeSlidesCloud::Object::PresentationToMerge->new();
        $presentation2->{path} = "file2";
        my @slides = ( 1, 2 );
        $presentation2->{slides} = \@slides;
        my @presentations = ( $presentation1, $presentation2 );
        $request->{presentations} = \@presentations;
        my %params = ('files' => \@files, 'request' => $request);
        $utils->{testSlidesApi}->merge_online(%params);
    };
    if ($@) {
        fail("merge_online raised an exception: $@");
    }
    pass();
};

subtest 'merge ordered combined' => sub {
    eval {
        my $source1 = read_file("TestData/test.pptx", { binmode => ':raw' });

        my %copy_params = ('src_path' => "TempTests/test-unprotected.pptx", 'dest_path' => "TempSlidesSDK/test-unprotected.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my @files = ( $source );
        my $request = AsposeSlidesCloud::Object::OrderedMergeRequest->new();
        my $presentation1 = AsposeSlidesCloud::Object::PresentationToMerge->new();
        $presentation1->{path} = "file1";
        $presentation1->{password} = "password";
        my $presentation2 = AsposeSlidesCloud::Object::PresentationToMerge->new();
        $presentation2->{path} = "TempSlidesSDK/test-unprotected.pptx";
        my @slides = ( 1, 2 );
        $presentation2->{slides} = \@slides;
        $presentation2->{source} = "Storage";
        my @presentations = ( $presentation1, $presentation2 );
        $request->{presentations} = \@presentations;
        my %params = ('files' => \@files, 'request' => $request);
        $utils->{testSlidesApi}->merge_online(%params);
    };
    if ($@) {
        fail("merge_online raised an exception: $@");
    }
    pass();
};


subtest 'merge ordered url' => sub {
    eval {
        my $request = AsposeSlidesCloud::Object::OrderedMergeRequest->new();

        my $presentation1 = AsposeSlidesCloud::Object::PresentationToMerge->new();
        my @slides1 = ( 1, 2 );
        $presentation1->{slides} = \@slides1;
        $presentation1->{source} = 'Storage';
        $presentation1->{path} = "TempSlidesSDK/test.pptx";
        $presentation1->{password} = 'password';

        my $presentation2 = AsposeSlidesCloud::Object::PresentationToMerge->new();
        my @slides2 = ( 1 );
        $presentation2->{slides} = \@slides2;
        $presentation2->{source} = 'Url';
        $presentation2->{path} = 'https://www.dropbox.com/scl/fi/nz3yt2wpg4eugiw12bz3g/info.pptx?rlkey=wju4vbi6h46q8733tzzvfgufz&e=1&st=pqt66x86&dl=1';
        
        my @presentations = ($presentation1, $presentation2);
        $request->{presentations} = \@presentations;

        my %params = ('request' => $request);
        my $response = $utils->{testSlidesApi}->merge_online(%params);

        ok (length($response) > 0)
    };
    if ($@) {
        fail("merge_online raised an exception: $@");
    }
    pass();
};

done_testing;
