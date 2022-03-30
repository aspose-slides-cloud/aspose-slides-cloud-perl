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
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::Paragraph;
use AsposeSlidesCloud::Object::Portion;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'layout slides' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        %copy_params = ('src_path' => "TempTests/TemplateCV.pptx", 'dest_path' => "TempSlidesSDK/TemplateCV.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $layout_slides = $utils->{api}->get_layout_slides(%params);
        is(scalar @{$layout_slides->{slide_list}}, 11);

        $params{slide_index} = 1;
        my $layout_slide = $utils->{api}->get_layout_slide(%params);
        is($layout_slide->{name}, "Title Slide");

        %params = ('name' => "test.pptx", 'clone_from' => "TempSlidesSDK/TemplateCV.pptx", 'clone_from_position' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
        $layout_slide = $utils->{api}->copy_layout_slide(%params);
        is($layout_slide->{name}, "Title and Content");

        %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        $layout_slides = $utils->{api}->get_layout_slides(%params);
        is(scalar @{$layout_slides->{slide_list}}, 12);
    };
    if ($@) {
        fail("get_layout_slides raised an exception: $@");
    }
    pass();
};

subtest 'layout slide shapes' => sub {
    eval {
        my $shape_count = 6;

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shapes = $utils->{api}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count);

        my $dto = AsposeSlidesCloud::Object::Shape->new();
        $dto->{x} = 100;
        $dto->{y} = 100;
        $dto->{width} = 500;
        $dto->{height }= 200;
        $dto->{shape_type} = "Rectangle";
        $dto->{text} = "New shape";
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $shape = $utils->{api}->create_special_slide_shape(%params);
        is($shape->{text}, $dto->{text});
        $shapes = $utils->{api}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count + 1);

        $dto->{text} = "Updated shape";
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => $shape_count + 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        $shape = $utils->{api}->update_special_slide_shape(%params);
        is($shape->{text}, $dto->{text});
        $shapes = $utils->{api}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count + 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => $shape_count + 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{api}->delete_special_slide_shape(%params);
        $shapes = $utils->{api}->get_special_slide_shapes(%list_params);
        is(scalar @{$shapes->{shapes_links}}, $shape_count);
    };
    if ($@) {
        fail("get_special_slide_shapes raised an exception: $@");
    }
    pass();
};

subtest 'layout slide paragraphs' => sub {
    eval {
        my $paragraph_count = 1;

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $paragraphs = $utils->{api}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count);

        my $portion = AsposeSlidesCloud::Object::Portion->new();
        $portion->{text} = "New Paragraph";
        my $dto = AsposeSlidesCloud::Object::Paragraph->new();
        $dto->{alignment} = "Right";
        my @portions = ( $portion );
        $dto->{portion_list} = \@portions;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $paragraph = $utils->{api}->create_special_slide_paragraph(%params);
        is($paragraph->{alignment}, $dto->{alignment});
        $paragraphs = $utils->{api}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count + 1);

        $dto = AsposeSlidesCloud::Object::Paragraph->new();
        $dto->{alignment} = "Center";
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'paragraph_index' => $paragraph_count + 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        $paragraph = $utils->{api}->update_special_slide_paragraph(%params);
        is($paragraph->{alignment}, $dto->{alignment});
        $paragraphs = $utils->{api}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count + 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'paragraph_index' => $paragraph_count + 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{api}->delete_special_slide_paragraph(%params);
        $paragraphs = $utils->{api}->get_special_slide_paragraphs(%list_params);
        is(scalar @{$paragraphs->{paragraph_links}}, $paragraph_count);
    };
    if ($@) {
        fail("get_special_slide_paragraphs raised an exception: $@");
    }
    pass();
};

subtest 'layout slide portions' => sub {
    eval {
        my $portion_count = 1;

        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portions = $utils->{api}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = "New portion";
        $dto->{font_bold} = 'True';
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portion = $utils->{api}->create_special_slide_portion(%params);
        is($portion->{font_bold}, $dto->{font_bold});
        is($portion->{text}, $dto->{text});
        $portions = $utils->{api}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count + 1);

        my $dto2 = AsposeSlidesCloud::Object::Portion->new();
        $dto2->{text} = "Updated portion";
        $dto2->{font_height} = 22;
        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'portion_index' => $portion_count + 1, 'dto' => $dto2, 'password' => "password", 'folder' => "TempSlidesSDK");
        $portion = $utils->{api}->update_special_slide_portion(%params);
        is($portion->{font_bold}, $dto->{font_bold});
        is($portion->{font_height}, $dto2->{font_height});
        is($portion->{text}, $dto2->{text});
        $portions = $utils->{api}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count + 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'shape_index' => 2, 'paragraph_index' => 1, 'portion_index' => $portion_count + 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{api}->delete_special_slide_portion(%params);
        $portions = $utils->{api}->get_special_slide_portions(%list_params);
        is(scalar @{$portions->{items}}, $portion_count);
    };
    if ($@) {
        fail("get_special_slide_portions raised an exception: $@");
    }
    pass();
};

subtest 'layout slide animation' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my %list_params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $animation = $utils->{api}->get_special_slide_animation(%list_params);
        is(scalar @{$animation->{main_sequence}}, 1);

        my $effect1 = AsposeSlidesCloud::Object::Effect->new();
        $effect1->{type} = "Blink";
        $effect1->{shape_index} = 2;

        my $effect2 = AsposeSlidesCloud::Object::Effect->new();
        $effect2->{type} = "Appear";
        $effect2->{shape_index} = 3;

        my $dto = AsposeSlidesCloud::Object::SlideAnimation->new();
        my @effects = ( $effect1, $effect2 );
        $dto->{main_sequence} = \@effects;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'animation' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        $animation = $utils->{api}->set_special_slide_animation(%params);
        is(scalar @{$animation->{main_sequence}}, scalar @{$dto->{main_sequence}});

        $list_params{shape_index} = 3;
        $animation = $utils->{api}->get_special_slide_animation(%list_params);
        is(scalar @{$animation->{main_sequence}}, 1);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'effect_index' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
        $animation = $utils->{api}->delete_special_slide_animation_effect(%params);
        is(scalar @{$animation->{main_sequence}}, scalar @{$dto->{main_sequence}} - 1);

        $animation = $utils->{api}->get_special_slide_animation(%list_params);
        is(scalar @{$animation->{main_sequence}}, 0);

        %params = ('name' => "test.pptx", 'slide_index' => 1, 'slide_type' => "LayoutSlide", 'password' => "password", 'folder' => "TempSlidesSDK");
        $animation = $utils->{api}->delete_special_slide_animation(%params);
        is(scalar @{$animation->{main_sequence}}, 0);
    };
    if ($@) {
        fail("get_special_slide_portions raised an exception: $@");
    }
    pass();
};

done_testing;
