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
use AsposeSlidesCloud::Object::Portion;
use AsposeSlidesCloud::Object::PortionFormat;

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

subtest 'replace text formatting' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $old_text = "banana";
        my $new_text = "orange";
        my $color = "#FFFFA500";

        my $portion = AsposeSlidesCloud::Object::Portion->new();
        $portion->{text} = $old_text;

        my $portion_format = AsposeSlidesCloud::Object::PortionFormat->new();
        $portion_format->{font_color} = $color;

        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'paragraph_index' => 1, 'position' => 1, 'dto' => $portion, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{api}->create_portion(%params);

        $params{old_value} = $old_text;
        $params{new_value} = $new_text;
        $params{portion_format} = $portion_format;
        $utils->{api}->replace_text_formatting(%params);

        $params{portion_index} = 1;
        my $updated_portion = $utils->{api}->get_portion(%params);
        is($updated_portion->{text}, $new_text);
        is($updated_portion->{font_color}, $color);
    };
    if ($@) {
        fail("replace_text_formatting raised an exception: $@");
    }
    pass();
};

subtest 'replace text formatting online' => sub {
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my $portion_format = AsposeSlidesCloud::Object::PortionFormat->new();
        $portion_format->{font_color} = "#FFFFA500";
        my %params = ('document' => $source, 'old_value' => "banana", 'new_value' => "orange", 'portion_format' => $portion_format, 'password' => "password");
        $utils->{api}->replace_text_formatting_online(%params);
    };
    if ($@) {
        fail("replace_text_formatting_online raised an exception: $@");
    }
    pass();
};

subtest 'highlight shape text' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $text_to_highlight = 'highlight';
        my $highlight_color = '#FFF5FF8A';
        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6,
            'shape_index' => 1,
            'text' => $text_to_highlight,
            'color' => $highlight_color,
            'ignore_case' => 0,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
            
        $utils->{api}->highlight_shape_text(%params);

        %params = (
            'name' => "test.pptx", 
            'slide_index' => 6,
            'shape_index' => 1,
            'paragraph_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        
        my $paragraph = $utils->{api}->get_paragraph(%params);
        
        ok(index($paragraph->{portion_list}[0]{text}, $text_to_highlight) == -1);
        ok(index($paragraph->{portion_list}[0]{highlight_color}, $highlight_color) == -1);
        ok(index($paragraph->{portion_list}[1]{text}, $text_to_highlight) != -1);
        ok(index($paragraph->{portion_list}[1]{highlight_color}, $highlight_color) != -1);
    };
    if ($@) {
        fail("highlight_shape_text raised an exception: $@");
    }
    pass();
};

subtest 'highlight shape regex' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $text_to_highlight = 'highlight';
        my $hightlight_regex = 'h.ghl[abci]ght';
        my $highlight_color = '#FFF5FF8A';

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6,
            'shape_index' => 1,
            'regex' => $hightlight_regex,
            'color' => $highlight_color,
            'ignore_case' => 0,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
            
        $utils->{api}->highlight_shape_regex(%params);

        %params = (
            'name' => "test.pptx", 
            'slide_index' => 6,
            'shape_index' => 1,
            'paragraph_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        
        my $paragraph = $utils->{api}->get_paragraph(%params);
        
        ok(index($paragraph->{portion_list}[0]{text}, $text_to_highlight) == -1);
        ok(index($paragraph->{portion_list}[0]{highlight_color}, $highlight_color) == -1);
        ok(index($paragraph->{portion_list}[1]{text}, $text_to_highlight) != -1);
        ok(index($paragraph->{portion_list}[1]{highlight_color}, $highlight_color) != -1);
    };
    if ($@) {
        fail("highlight_shape_regex raised an exception: $@");
    }
    pass();
};

done_testing;
