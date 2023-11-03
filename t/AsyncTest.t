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

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'async convert' => sub {
    eval {
        my $maxTries = 10;
        my $sleepTimeout = 3;
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'format' => 'Pdf', 'password' => 'password');
        my $operationId = $utils->{testSlidesAsyncApi}->start_convert(%params);
        my $operation;
        my %getStatusParams = ('id' => $operationId);
        for (my $i = 0; $i < $maxTries; $i++) {
            sleep($sleepTimeout);
            $operation = $utils->{testSlidesAsyncApi}->get_operation_status(%getStatusParams);
            if ($operation->{status} ne 'Created' && $operation->{status} ne 'Enqueued' && $operation->{status} ne 'Started') {
                last;
            }
        }
        is($operation->{status}, 'Finished');
        ok(not $operation->{error});

        my $converted = $utils->{testSlidesAsyncApi}->get_operation_result(%getStatusParams);
        ok(length($converted));
    };
    if ($@) {
        fail("async convert raised an exception: $@");
    }
    pass();
};

subtest 'async download presentation' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $maxTries = 10;
        my $sleepTimeout = 3;
        my %params = ('name' => 'test.pptx', 'format' => 'Pdf', 'password' => 'password', 'folder' => "TempSlidesSDK");
        my $operationId = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
        my $operation;
        my %getStatusParams = ('id' => $operationId);
        for (my $i = 0; $i < $maxTries; $i++) {
            sleep($sleepTimeout);
            $operation = $utils->{testSlidesAsyncApi}->get_operation_status(%getStatusParams);
            if ($operation->{status} ne 'Created' && $operation->{status} ne 'Enqueued' && $operation->{status} ne 'Started') {
                last;
            }
        }
        is($operation->{status}, 'Finished');
        ok(not $operation->{error});

        my $converted = $utils->{testSlidesAsyncApi}->get_operation_result(%getStatusParams);
        ok(length($converted));
    };
    if ($@) {
        fail("async download presentation raised an exception: $@");
    }
    pass();
};

subtest 'async bad operation' => sub {
    eval {
        my $maxTries = 10;
        my $sleepTimeout = 3;
        my %params = ('name' => 'IDoNotExist.pptx', 'format' => 'Pdf');
        my $operationId = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
        my $operation;
        for (my $i = 0; $i < $maxTries; $i++) {
            sleep($sleepTimeout);
            my %getStatusParams = ('id' => $operationId);
            $operation = $utils->{testSlidesAsyncApi}->get_operation_status(%getStatusParams);
            if ($operation->{status} ne 'Created' && $operation->{status} ne 'Enqueued' && $operation->{status} ne 'Started') {
                last;
            }
        }
        is($operation->{status}, 'Failed');
        ok($operation->{error});
    };
    if ($@) {
        fail("async bad operation raised an exception: $@");
    }
    pass();
};

done_testing;
