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
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::Paragraph;
use AsposeSlidesCloud::Object::Portion;
use AsposeSlidesCloud::Object::NotesSlide;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'notes slide get from storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->get_notes_slide(%params);
        ok($result->{text});
    };
    if ($@) {
        fail("get_notes_slide raised an exception: $@");
    }
    pass();
};

subtest 'notes slide exists from storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->notes_slide_exists(%params);
        ok($result->{exists});
    };
    if ($@) {
        fail("notes_slide_exists raised an exception: $@");
    }
    pass();
};

subtest 'notes slide download from storage' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'format' => "png", 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->download_notes_slide(%params);
    };
    if ($@) {
        fail("download_notes_slide raised an exception: $@");
    }
    pass();
};

subtest 'notes slide get from request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'password' => "password");
        $utils->{testSlidesApi}->get_notes_slide_online(%params);
    };
    if ($@) {
        fail("get_notes_slide_online raised an exception: $@");
    }
    pass();
};

subtest 'notes slide exists from request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'password' => "password");
        my $result = $utils->{testSlidesApi}->notes_slide_exists_online(%params);
        ok($result->{exists});
    };
    if ($@) {
        fail("notes_slide_exists_online raised an exception: $@");
    }
    pass();
};

subtest 'notes slide download from request' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'format' => "png", 'password' => "password");
        $utils->{testSlidesApi}->download_notes_slide_online(%params);
    };
    if ($@) {
        fail("download_notes_slide_online raised an exception: $@");
    }
    pass();
};

subtest 'notes slide shapes' => sub {
    eval {
        my $shape_count = 3;

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shapes = $utils->{testSlidesApi}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count);

        my $dto = AsposeSlidesCloud::Object::Shape->new();
        $dto->{x} = 100;
        $dto->{y} = 100;
        $dto->{width} = 500;
        $dto->{height }= 200;
        $dto->{shape_type} = "Rectangle";
        $dto->{text} = "New shape";
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shape = $utils->{testSlidesApi}->create_special_slide_shape(%params);
        is($shape->{text}, $dto->{text});
        $shapes = $utils->{testSlidesApi}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count + 1);

        $dto->{text} = "Updated shape";
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => $shape_count + 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        $shape = $utils->{testSlidesApi}->update_special_slide_shape(%params);
        is($shape->{text}, $dto->{text});
        $shapes = $utils->{testSlidesApi}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count + 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => $shape_count + 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_special_slide_shape(%params);
        $shapes = $utils->{testSlidesApi}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count);
    };
    if ($@) {
        fail("get_special_slide_shapes raised an exception: $@");
    }
    pass();
};

subtest 'notes slide paragraphs' => sub {
    eval {
        my $paragraph_count = 1;

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $paragraphs = $utils->{testSlidesApi}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count);

        my $portion = AsposeSlidesCloud::Object::Portion->new();
        $portion->{text} = "New Paragraph";
        my $dto = AsposeSlidesCloud::Object::Paragraph->new();
        $dto->{alignment} = "Right";
        my @portions = ( $portion );
        $dto->{portion_list} = \@portions;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $paragraph = $utils->{testSlidesApi}->create_special_slide_paragraph(%params);
        is($paragraph->{alignment}, $dto->{alignment});
        $paragraphs = $utils->{testSlidesApi}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count + 1);

        $dto = AsposeSlidesCloud::Object::Paragraph->new();
        $dto->{alignment} = "Center";
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'paragraph_index' => $paragraph_count + 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        $paragraph = $utils->{testSlidesApi}->update_special_slide_paragraph(%params);
        is($paragraph->{alignment}, $dto->{alignment});
        $paragraphs = $utils->{testSlidesApi}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count + 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'paragraph_index' => $paragraph_count + 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_special_slide_paragraph(%params);
        $paragraphs = $utils->{testSlidesApi}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count);
    };
    if ($@) {
        fail("get_special_slide_paragraphs raised an exception: $@");
    }
    pass();
};

subtest 'notes slide portions' => sub {
    eval {
        my $portion_count = 1;

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portions = $utils->{testSlidesApi}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = "New portion";
        $dto->{font_bold} = 'True';
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portion = $utils->{testSlidesApi}->create_special_slide_portion(%params);
        is($portion->{font_bold}, $dto->{font_bold});
        is($portion->{text}, $dto->{text});
        $portions = $utils->{testSlidesApi}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count + 1);

        my $dto2 = AsposeSlidesCloud::Object::Portion->new();
        $dto2->{text} = "Updated portion";
        $dto2->{font_height} = 22;
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'portion_index' => $portion_count + 1, 'dto' => $dto2, 'password' => "password", 'folder' => "TempSlidesSDK");
        $portion = $utils->{testSlidesApi}->update_special_slide_portion(%params);
        is($portion->{font_bold}, $dto->{font_bold});
        is($portion->{font_height}, $dto2->{font_height});
        is($portion->{text}, $dto2->{text});
        $portions = $utils->{testSlidesApi}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count + 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "NotesSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'portion_index' => $portion_count + 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->delete_special_slide_portion(%params);
        $portions = $utils->{testSlidesApi}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count);
    };
    if ($@) {
        fail("get_special_slide_portions raised an exception: $@");
    }
    pass();
};

subtest 'create notes slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

		my $dto = AsposeSlidesCloud::Object::NotesSlide->new();
        my $notes_slide_text = 'Notes slide text';
        $dto->{text} = $notes_slide_text;

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $response = $utils->{testSlidesApi}->create_notes_slide(%params);
        is ($response->{text}, $notes_slide_text);
	};
    if ($@) {
        fail("create_notes_slide raised an exception: $@");
    }
    pass();
};

subtest 'update notes slide' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

		my $dto = AsposeSlidesCloud::Object::NotesSlide->new();
        my $notes_slide_text = 'Notes slide text';
        $dto->{text} = $notes_slide_text;

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $response = $utils->{testSlidesApi}->update_notes_slide(%params);
        is ($response->{text}, $notes_slide_text);
	};
    if ($@) {
        fail("update_notes_slide raised an exception: $@");
    }
    pass();
};

subtest 'delete notes slide' => sub {
    my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

    eval {
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $response = $utils->{testSlidesApi}->delete_notes_slide(%params);
	};
    if ($@) {
        fail("delete_notes_slide raised an exception: $@");
    }
    pass();
};

done_testing;
