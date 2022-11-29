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
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::Paragraph;
use AsposeSlidesCloud::Object::Portion;
use AsposeSlidesCloud::Object::SolidFill;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'get portions' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1, 
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        my $response = $utils->{api}->get_portions(%params);
        is(scalar @{$response->{items}}, 2);
	};
    if ($@) {
        fail("get_portions raised an exception: $@");
    }
    pass();
};

subtest 'get sub_shape portions' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1, 
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');
        my $response = $utils->{api}->get_portions(%params);
        is(scalar @{$response->{items}}, 2);
	};
    if ($@) {
        fail("get_portions raised an exception: $@");
    }
    pass();
};

subtest 'get portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1,
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{api}->get_portion(%params);
        ok(index($response->{text}, 'portion 1') != -1);
	};
    if ($@) {
        fail("get_portion raised an exception: $@");
    }
    pass();
};

subtest 'get sub-shape portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1,
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');

        my $response = $utils->{api}->get_portion(%params);
        ok(index($response->{text}, 'portion 1') != -1);
	};
    if ($@) {
        fail("get_portion raised an exception: $@");
    }
    pass();
};

subtest 'create portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = 'Portion 1';
        $dto->{font_bold} = 'True';
        $dto->{font_height} = 20;
        $dto->{latin_font} = 'Arial';
        my $fill_format = AsposeSlidesCloud::Object::SolidFill->new();
        $fill_format->{color} = '#FFF5FF8A';
        $dto->{fill_format} = $fill_format;


		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1, 
            'dto' => $dto,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        my $response = $utils->{api}->create_portion(%params);

        is($response->{text}, $dto->{text});
        is($response->{font_bold}, 'True');
        is($response->{font_height}, $dto->{font_height});
        is($response->{latin_font}, $dto->{latin_font});
        is($response->{fill_format}->{type}, 'Solid');
	};
    if ($@) {
        fail("create_portion raised an exception: $@");
    }
    pass();
};

subtest 'create sub-shape portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = 'Portion 1';
        $dto->{font_bold} = 'True';
        $dto->{font_height} = 20;
        $dto->{latin_font} = 'Arial';
        my $fill_format = AsposeSlidesCloud::Object::SolidFill->new();
        $fill_format->{color} = '#FFF5FF8A';
        $dto->{fill_format} = $fill_format;


		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1, 
            'dto' => $dto,
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');
        my $response = $utils->{api}->create_portion(%params);

        is($response->{text}, $dto->{text});
        is($response->{font_bold}, 'True');
        is($response->{font_height}, $dto->{font_height});
        is($response->{latin_font}, $dto->{latin_font});
        is($response->{fill_format}->{type}, 'Solid');
	};
    if ($@) {
        fail("create_portion raised an exception: $@");
    }
    pass();
};

subtest 'update portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = 'Portion 1';
        $dto->{font_bold} = 'True';
        $dto->{font_height} = 20;
        $dto->{latin_font} = 'Arial';
        my $fill_format = AsposeSlidesCloud::Object::SolidFill->new();
        $fill_format->{color} = '#FFF5FF8A';
        $dto->{fill_format} = $fill_format;


		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1, 
            'portion_index' => 1,
            'dto' => $dto,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        my $response = $utils->{api}->update_portion(%params);

        is($response->{text}, $dto->{text});
        is($response->{font_bold}, 'True');
        is($response->{font_height}, $dto->{font_height});
        is($response->{latin_font}, $dto->{latin_font});
        is($response->{fill_format}->{type}, 'Solid');
	};
    if ($@) {
        fail("update_portion raised an exception: $@");
    }
    pass();
};

subtest 'update sub-shape portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::Portion->new();
        $dto->{text} = 'Portion 1';
        $dto->{font_bold} = 'True';
        $dto->{font_height} = 20;
        $dto->{latin_font} = 'Arial';
        my $fill_format = AsposeSlidesCloud::Object::SolidFill->new();
        $fill_format->{color} = '#FFF5FF8A';
        $dto->{fill_format} = $fill_format;


		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1, 
            'portion_index' => 1,
            'dto' => $dto,
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');
        my $response = $utils->{api}->update_portion(%params);

        is($response->{text}, $dto->{text});
        is($response->{font_bold}, 'True');
        is($response->{font_height}, $dto->{font_height});
        is($response->{latin_font}, $dto->{latin_font});
        is($response->{fill_format}->{type}, 'Solid');
	};
    if ($@) {
        fail("update_portion raised an exception: $@");
    }
    pass();
};

subtest 'delete portions' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1, 
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        my $response = $utils->{api}->delete_portions(%params);
        is(scalar @{$response->{items}}, 0);
	};
    if ($@) {
        fail("delete_portions raised an exception: $@");
    }
    pass();
};

subtest 'delete portions indexes' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my @indexes = (1);
		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1, 
            'portions' => \@indexes,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        my $response = $utils->{api}->delete_portions(%params);
        is(scalar @{$response->{items}}, 1);
	};
    if ($@) {
        fail("delete_portions raised an exception: $@");
    }
    pass();
};

subtest 'delete sub-shape portions' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1, 
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');

        my $response = $utils->{api}->delete_portions(%params);
        is(scalar @{$response->{items}}, 0);
	};
    if ($@) {
        fail("delete_portions raised an exception: $@");
    }
    pass();
};

subtest 'delete sub-shape portions indexes' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

        my @indexes = (1);
		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1, 
            'portions' => \@indexes,
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');
        my $response = $utils->{api}->delete_portions(%params);
        is(scalar @{$response->{items}}, 1);
	};
    if ($@) {
        fail("delete_portions raised an exception: $@");
    }
    pass();
};

subtest 'delete portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1, 
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");
        my $response = $utils->{api}->delete_portion(%params);
        is(scalar @{$response->{items}}, 1);
	};
    if ($@) {
        fail("delete_portion raised an exception: $@");
    }
    pass();
};

subtest 'delete sub-shape portion' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1, 
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');
        my $response = $utils->{api}->delete_portion(%params);
        is(scalar @{$response->{items}}, 1);
	};
    if ($@) {
        fail("delete_portion raised an exception: $@");
    }
    pass();
};

subtest 'get portion rect' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1,
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{api}->get_portion_rectangle(%params);
        ok($response->{x} > 0);
        ok($response->{y} > 0);
        ok($response->{width} > 0);
        ok($response->{height} > 0);
	};
    if ($@) {
        fail("get_portion_rectangle raised an exception: $@");
    }
    pass();
};

subtest 'get portion effective' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 2, 
            'paragraph_index' => 1,
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{api}->get_portion_effective(%params);
        is($response->{font_height}, 18);
	};
    if ($@) {
        fail("get_portion_effective raised an exception: $@");
    }
    pass();
};

subtest 'get sub-shape portion effective' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = (
            'name' => "test.pptx", 
            'slide_index' => 6, 
            'shape_index' => 3, 
            'paragraph_index' => 1,
            'portion_index' => 1,
            'password' => "password", 
            'folder' => "TempSlidesSDK",
            'sub_shape' => '1');

        my $response = $utils->{api}->get_portion_effective(%params);
        is($response->{font_height}, 18);
	};
    if ($@) {
        fail("get_portion_effective raised an exception: $@");
    }
    pass();
};

done_testing;