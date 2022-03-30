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
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::PictureFrame;
use AsposeSlidesCloud::Object::Portion;
use AsposeSlidesCloud::Object::HeaderFooter;
use AsposeSlidesCloud::Object::NotesSlideHeaderFooter;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'hyperlink get shape' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->get_shape(%params);
        ok($result->{hyperlink_click});
        is($result->{hyperlink_click}->{action_type}, "Hyperlink");
        ok(not $result->{hyperlink_mouse_over});
    };
    if ($@) {
        fail("get_shape raised an exception: $@");
    }
    pass();
};

subtest 'hyperlink get portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 1, 'paragraph_index' => 1, 'portion_index' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->get_portion(%params);
        ok(not $result->{hyperlink_click});
        ok($result->{hyperlink_mouse_over});
        is($result->{hyperlink_mouse_over}->{action_type}, "JumpLastSlide");
    };
    if ($@) {
        fail("get_portion raised an exception: $@");
    }
    pass();
};

subtest 'hyperlink create shape' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $shape = AsposeSlidesCloud::Object::Shape->new();
        my $hyperlink = AsposeSlidesCloud::Object::Hyperlink->new();
        $hyperlink->{action_type} = "Hyperlink";
        $hyperlink->{external_url} = "https://docs.aspose.cloud/slides";
        $shape->{hyperlink_click} = $hyperlink;
        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 2, 'dto' => $shape, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->update_shape(%params);
        ok($result->{hyperlink_click});
        is($result->{hyperlink_click}->{external_url}, $shape->{hyperlink_click}->{external_url});
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

subtest 'hyperlink create portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = "Link text";
        my $hyperlink = AsposeSlidesCloud::Object::Hyperlink->new();
        $hyperlink->{action_type} = "JumpLastSlide";
        $dto->{hyperlink_mouse_over} = $hyperlink;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'paragraph_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->create_portion(%params);
        ok($result->{hyperlink_mouse_over});
        is($result->{hyperlink_mouse_over}->{action_type}, $dto->{hyperlink_mouse_over}->{action_type});
    };
    if ($@) {
        fail("create_portion raised an exception: $@");
    }
    pass();
};

subtest 'hyperlink delete' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::PictureFrame->new();
        my $hyperlink = AsposeSlidesCloud::Object::Hyperlink->new();
        $hyperlink->{is_disabled} = 1;
        $dto->{hyperlink_click} = $hyperlink;
        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 2, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{api}->update_shape(%params);
        ok(not $result->{hyperlink_click});
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

done_testing;
