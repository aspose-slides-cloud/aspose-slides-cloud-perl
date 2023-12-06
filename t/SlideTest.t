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

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::Slide;
use AsposeSlidesCloud::Object::SlideShowTransition;
use AsposeSlidesCloud::Object::ResourceUri;
use AsposeSlidesCloud::Object::SlideBackground;
use AsposeSlidesCloud::Object::SolidFill;

use Test::More;
use Test::Exception;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'get slides' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $response = $utils->{testSlidesApi}->get_slides(%params);
        is(scalar @{$response->{slide_list}}, 9);
    };
    if ($@) {
        fail("get_slides raised an exception: $@");
    }
    pass();
};

subtest 'get slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $response = $utils->{testSlidesApi}->get_slide(%params);
        ok($response != undef)
    };
    if ($@) {
        fail("get_slide raised an exception: $@");
    }
    pass();
};

subtest 'create slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'layout_alias' => 'layoutSlides/3', 
            'position' => 1, 
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->create_slide(%params);
        is (scalar @{$response->{slide_list}}, 10);

        %params = (
            'name' => "test.pptx",
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        $response = $utils->{testSlidesApi}->create_slide(%params);
        is (scalar @{$response->{slide_list}}, 11)
    };
    if ($@) {
        fail("create_slide raised an exception: $@");
    }
    pass();
};

subtest 'copy slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_to_copy' => 3,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->copy_slide(%params);
        is (scalar @{$response->{slide_list}}, 10);
    };
    if ($@) {
        fail("copy_slide raised an exception: $@");
    }
    pass();
};

subtest 'copy slide from source' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        %copy_params = ('src_path' => "TempTests/TemplateCV.pptx", 'dest_path' => "TempSlidesSDK/TemplateCV.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_to_copy' => 1,
            'position' => 1,
            'source' => 'TempSlidesSDK/TemplateCV.pptx',
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->copy_slide(%params);
        is (scalar @{$response->{slide_list}}, 10);
    };
    if ($@) {
        fail("copy_slide raised an exception: $@");
    }
    pass();
};

subtest 'move slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 3,
            'new_position' => 2,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->move_slide(%params);
        is (scalar @{$response->{slide_list}}, 9);
    };
    if ($@) {
        fail("move_slide raised an exception: $@");
    }
    pass();
};

subtest 'reorder slides' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my @old_positions = (1, 2, 3, 4, 5, 6);
        my @new_positions = (6, 5, 4, 3, 2, 1);

        my %params = (
            'name' => "test.pptx", 
            'old_positions' => \@old_positions,
            'new_positions' => \@new_positions,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->reorder_slides(%params);
        is (scalar @{$response->{slide_list}}, 9);
    };
    if ($@) {
        fail("reorder_slides raised an exception: $@");
    }
    pass();
};

subtest 'update slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Slide->new();
        my $layout_slide = AsposeSlidesCloud::Object::ResourceUri->new();
        $layout_slide->{href} = 'layoutSlides/3';
        $dto->{layout_slide} = $layout_slide;

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 1,
            'slide_dto' => $dto, 
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->update_slide(%params);
        ok (index($response->{layout_slide}->{href}, $layout_slide != -1));
    };
    if ($@) {
        fail("update_slide raised an exception: $@");
    }
    pass();
};

subtest 'set slide transition' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Slide->new();
        my $transition = AsposeSlidesCloud::Object::SlideShowTransition->new();
        $transition->{type} = 'Circle';
        $transition->{speed} = 'Medium';
        $dto->{slide_show_transition} = $transition;

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 1,
            'slide_dto' => $dto, 
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->update_slide(%params);
        is ($dto->{slide_show_transition}->{type}, $response->{slide_show_transition}->{type});
    };
    if ($@) {
        fail("update_slide raised an exception: $@");
    }
    pass();
};

subtest 'delete slides' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->delete_slides(%params);
        is (scalar @{$response->{slide_list}}, 1);
    };
    if ($@) {
        fail("delete_slides raised an exception: $@");
    }
    pass();
};

subtest 'delete slides indexes' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my @indexes = (1, 3, 5);
        my %params = (
            'name' => "test.pptx", 
            'slides' => \@indexes,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->delete_slides(%params);
        is (scalar @{$response->{slide_list}}, 6);
    };
    if ($@) {
        fail("delete_slides raised an exception: $@");
    }
    pass();
};

subtest 'delete slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->delete_slide(%params);
        is (scalar @{$response->{slide_list}}, 8);
    };
    if ($@) {
        fail("delete_slide raised an exception: $@");
    }
    pass();
};

subtest 'get background' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 5,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->get_background(%params);
        is ($response->{fill_format}->{type}, 'Solid');
    };
    if ($@) {
        fail("get_background raised an exception: $@");
    }
    pass();
};

subtest 'set background' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::SlideBackground->new();
        my $fill_format = AsposeSlidesCloud::Object::SolidFill->new();
        $fill_format->{color} = '#FFF5FF8A';
        $dto->{fill_format} = $fill_format;

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 5,
            'background' => $dto,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->set_background(%params);
        is ($response->{fill_format}->{type}, 'Solid');
        is ($response->{fill_format}->{color}, $fill_format->color);
    };
    if ($@) {
        fail("set_background raised an exception: $@");
    }
    pass();
};

subtest 'set background color' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 1,
            'color' => '#FFF5FF8A',
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->set_background_color(%params);
        is ($response->{fill_format}->{type}, 'Solid');
        is ($response->{fill_format}->{color}, '#FFF5FF8A');
    };
    if ($@) {
        fail("set_background_color raised an exception: $@");
    }
    pass();
};

subtest 'delete background color' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 5,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{testSlidesApi}->delete_background(%params);
        is ($response->{fill_format}->{type}, 'NoFill');
    };
    if ($@) {
        fail("delete_background raised an exception: $@");
    }
    pass();
};

done_testing;