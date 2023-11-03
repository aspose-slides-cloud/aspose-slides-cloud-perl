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
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::HeaderFooter;
use AsposeSlidesCloud::Object::NotesSlideHeaderFooter;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'header footer all slides' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::HeaderFooter->new();
        $dto->{is_footer_visible} = 1;
        $dto->{footer_text} = "footer";
        $dto->{is_date_time_visible} = 0;
        my %params = ('name' => "test.pptx", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->set_presentation_header_footer(%params);
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->get_slide_header_footer(%params);
        ok($result->{is_footer_visible});
        ok(not $result->{is_date_time_visible});
    };
    if ($@) {
        fail("set_presentation_header_footer raised an exception: $@");
    }
    pass();
};

subtest 'header footer slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::HeaderFooter->new();
        $dto->{is_footer_visible} = 1;
        $dto->{footer_text} = "footer";
        $dto->{is_date_time_visible} = 0;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->set_slide_header_footer(%params);
        ok($result->{is_footer_visible});
        ok(not $result->{is_date_time_visible});
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $result = $utils->{testSlidesApi}->get_slide_header_footer(%params);
        ok($result->{is_footer_visible});
        ok(not $result->{is_date_time_visible});
    };
    if ($@) {
        fail("set_presentation_header_footer raised an exception: $@");
    }
    pass();
};

subtest 'header notes slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::NotesSlideHeaderFooter->new();
        $dto->{is_header_visible} = 1;
        $dto->{footer_text} = "footer";
        $dto->{is_date_time_visible} = 0;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->set_notes_slide_header_footer(%params);
        ok($result->{is_header_visible});
        ok(not $result->{is_date_time_visible});
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $result = $utils->{testSlidesApi}->get_notes_slide_header_footer(%params);
        ok($result->{is_header_visible});
        ok(not $result->{is_date_time_visible});
    };
    if ($@) {
        fail("set_presentation_header_footer raised an exception: $@");
    }
    pass();
};

done_testing;
