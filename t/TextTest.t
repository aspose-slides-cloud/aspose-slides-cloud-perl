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

subtest 'text get' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->get_presentation_text_items(%params);
        $params{with_empty} = 1;
        my $result_with_empty = $utils->{api}->get_presentation_text_items(%params);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $slide_result = $utils->{api}->get_slide_text_items(%params);
        $params{with_empty} = 1;
        my $slide_result_with_empty = $utils->{api}->get_slide_text_items(%params);

        ok(scalar @{$result_with_empty->{items}} > scalar @{$result->{items}});
        ok(scalar @{$result->{items}} > scalar @{$slide_result->{items}});
        ok(scalar @{$slide_result_with_empty->{items}} > scalar @{$slide_result->{items}});
    };
    if ($@) {
        fail("get_presentation_text_items raised an exception: $@");
    }
    pass();
};

subtest 'text replace storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);
        my %params = ('name' => "test.pptx", 'old_value' => "text", 'new_value' => "new_text", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->replace_presentation_text(%params);

        $utils->{api}->copy_file(%copy_params);
        $params{ignore_case} = 1;
        my $result_ignore_case = $utils->{api}->replace_presentation_text(%params);

        $utils->{api}->copy_file(%copy_params);
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'old_value' => "text", 'new_value' => "new_text", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $slide_result = $utils->{api}->replace_slide_text(%params);

        $utils->{api}->copy_file(%copy_params);
        $params{ignore_case} = 1;
        my $slide_result_ignore_case = $utils->{api}->replace_slide_text(%params);

        ok($result_ignore_case->{matches} > $result->{matches});
        ok($result->{matches} > $slide_result->{matches});
        ok($slide_result_ignore_case->{matches} > $slide_result->{matches});
    };
    if ($@) {
        fail("replace_presentation_text raised an exception: $@");
    }
    pass();
};

subtest 'text replace request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'old_value' => "text", 'new_value' => "new_text", 'password' => "password");
        $utils->{api}->replace_presentation_text_online(%params);

        $params{ignore_case} = 1;
        $utils->{api}->replace_presentation_text_online(%params);

        %params = ('document' => $source, 'slide_index' => 1, 'old_value' => "text", 'new_value' => "new_text", 'password' => "password");
        $utils->{api}->replace_slide_text_online(%params);

        $params{ignore_case} = 1;
        $utils->{api}->replace_slide_text_online(%params);
    };
    if ($@) {
        fail("replace_presentation_text_online raised an exception: $@");
    }
    pass();
};

done_testing;
