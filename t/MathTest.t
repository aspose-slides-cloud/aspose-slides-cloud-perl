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
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::Portion;
use AsposeSlidesCloud::Object::FunctionElement;
use AsposeSlidesCloud::Object::LimitElement;
use AsposeSlidesCloud::Object::TextElement;
use AsposeSlidesCloud::Object::FractionElement;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'math get' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 3, 'paragraph_index' => 1, 'portion_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portion = $utils->{testSlidesApi}->get_portion(%params);
        ok($portion->{math_paragraph});
        ok($portion->{math_paragraph}{math_block_list});
        is(scalar @{$portion->{math_paragraph}{math_block_list}}, 1);
        ok($portion->{math_paragraph}{math_block_list}[0]{math_element_list});
        is(scalar @{$portion->{math_paragraph}{math_block_list}[0]{math_element_list}}, 3);
        is(ref $portion->{math_paragraph}{math_block_list}[0]{math_element_list}[2], "AsposeSlidesCloud::Object::FractionElement");
    };
    if ($@) {
        fail("get_portion raised an exception: $@");
    }
    pass();
};

subtest 'math get null' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 1, 'paragraph_index' => 1, 'portion_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portion = $utils->{testSlidesApi}->get_portion(%params);
        ok(not $portion->{math_paragraph});
    };
    if ($@) {
        fail("get_portion raised an exception: $@");
    }
    pass();
};

subtest 'math create' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        my $math_paragraph = AsposeSlidesCloud::Object::MathParagraph->new();
        my $math_block = AsposeSlidesCloud::Object::BlockElement->new();
        my $function_element = AsposeSlidesCloud::Object::FunctionElement->new();
        my $limit_element = AsposeSlidesCloud::Object::LimitElement->new();
        my $text1 = AsposeSlidesCloud::Object::TextElement->new();
        $text1->{value} = "lim";
        $limit_element->{base} = $text1;
        my $text2 = AsposeSlidesCloud::Object::TextElement->new();
        $text2->{value} = "x->0";
        $limit_element->{limit} = $text2;
        $function_element->{name} = $limit_element;
        my $fraction_element = AsposeSlidesCloud::Object::FractionElement->new();
        my $sinus_element = AsposeSlidesCloud::Object::FunctionElement->new();
        my $text3 = AsposeSlidesCloud::Object::TextElement->new();
        $text3->{value} = "sin";
        $sinus_element->{name} = $text3;
        my $text4 = AsposeSlidesCloud::Object::TextElement->new();
        $text4->{value} = "x";
        $sinus_element->{name} = $text4;
        $fraction_element->{numerator} = $sinus_element;
        my $text5 = AsposeSlidesCloud::Object::TextElement->new();
        $text5->{value} = "x";
        $fraction_element->{denominator} = $text5;
        $function_element->{base} = $fraction_element;
        my @math_element_list = ( $function_element );
        $math_block->{math_element_list} = \@math_element_list;
        my @math_block_list = ( $math_block );
        $math_paragraph->{math_block_list} = \@math_block_list;
        $dto->{math_paragraph} = $math_paragraph;
        my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'paragraph_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portion = $utils->{testSlidesApi}->create_portion(%params);
        ok($portion->{math_paragraph});
        ok($portion->{math_paragraph}{math_block_list});
        is(scalar @{$portion->{math_paragraph}{math_block_list}}, 1);
        ok($portion->{math_paragraph}{math_block_list}[0]{math_element_list});
        is(scalar @{$portion->{math_paragraph}{math_block_list}[0]{math_element_list}}, 1);
        is(ref $portion->{math_paragraph}{math_block_list}[0]{math_element_list}[0], "AsposeSlidesCloud::Object::FunctionElement");
    };
    if ($@) {
        fail("create_portion raised an exception: $@");
    }
    pass();
};

subtest 'math update' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        my $math_paragraph = AsposeSlidesCloud::Object::MathParagraph->new();
        my $math_block = AsposeSlidesCloud::Object::BlockElement->new();
        my $function_element = AsposeSlidesCloud::Object::FunctionElement->new();
        my $limit_element = AsposeSlidesCloud::Object::LimitElement->new();
        my $text1 = AsposeSlidesCloud::Object::TextElement->new();
        $text1->{value} = "lim";
        $limit_element->{base} = $text1;
        my $text2 = AsposeSlidesCloud::Object::TextElement->new();
        $text2->{value} = "x->0";
        $limit_element->{limit} = $text2;
        $function_element->{name} = $limit_element;
        my $fraction_element = AsposeSlidesCloud::Object::FractionElement->new();
        my $sinus_element = AsposeSlidesCloud::Object::FunctionElement->new();
        my $text3 = AsposeSlidesCloud::Object::TextElement->new();
        $text3->{value} = "sin";
        $sinus_element->{name} = $text3;
        my $text4 = AsposeSlidesCloud::Object::TextElement->new();
        $text4->{value} = "x";
        $sinus_element->{name} = $text4;
        $fraction_element->{numerator} = $sinus_element;
        my $text5 = AsposeSlidesCloud::Object::TextElement->new();
        $text5->{value} = "x";
        $fraction_element->{denominator} = $text5;
        $function_element->{base} = $fraction_element;
        my @math_element_list = ( $function_element );
        $math_block->{math_element_list} = \@math_element_list;
        my @math_block_list = ( $math_block );
        $math_paragraph->{math_block_list} = \@math_block_list;
        $dto->{math_paragraph} = $math_paragraph;
        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 3, 'paragraph_index' => 1, 'portion_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $portion = $utils->{testSlidesApi}->update_portion(%params);
        ok($portion->{math_paragraph});
        ok($portion->{math_paragraph}{math_block_list});
        is(scalar @{$portion->{math_paragraph}{math_block_list}}, 1);
        ok($portion->{math_paragraph}{math_block_list}[0]{math_element_list});
        is(scalar @{$portion->{math_paragraph}{math_block_list}[0]{math_element_list}}, 1);
        is(ref $portion->{math_paragraph}{math_block_list}[0]{math_element_list}[0], "AsposeSlidesCloud::Object::FunctionElement");
    };
    if ($@) {
        fail("update_portion raised an exception: $@");
    }
    pass();
};

subtest 'math download' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 3, 'paragraph_index' => 1, 'portion_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        my $mathMl = $utils->{testSlidesApi}->download_portion_as_math_ml(%params);
        ok(length($mathMl));
    };
    if ($@) {
        fail("download_portion_as_math_ml raised an exception: $@");
    }
    pass();
};

subtest 'math download null' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 1, 'paragraph_index' => 1, 'portion_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->download_portion_as_math_ml(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("Must have failed because conversion to MathML works only for math portions");
    }
    pass();
};

subtest 'math save' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $out_path = "TempSlidesSDK/mathml.xml";
        my %params = ('name' => "test.pptx", 'slide_index' => 2, 'shape_index' => 3, 'paragraph_index' => 1, 'portion_index' => 1, 'out_path' => $out_path, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->save_portion_as_math_ml(%params);

        %params = ('path' => $out_path);
        my $exists = $utils->{testSlidesApi}->object_exists(%params);
        ok($exists->{exists});
    };
    if ($@) {
        fail("save_portion_as_math_ml raised an exception: $@");
    }
    pass();
};

done_testing;
