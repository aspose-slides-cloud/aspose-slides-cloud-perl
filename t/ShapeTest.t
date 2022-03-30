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
use AsposeSlidesCloud::Object::GraphicalObject;
use AsposeSlidesCloud::Object::PictureFrame;
use AsposeSlidesCloud::Object::AudioFrame;
use AsposeSlidesCloud::Object::VideoFrame;
use AsposeSlidesCloud::Object::OleObjectFrame;
use AsposeSlidesCloud::Object::SmartArt;
use AsposeSlidesCloud::Object::Chart;
use AsposeSlidesCloud::Object::Table;
use AsposeSlidesCloud::Object::GroupShape;
use AsposeSlidesCloud::Object::Connector;
use AsposeSlidesCloud::Object::GeometryPaths;
use AsposeSlidesCloud::Object::MoveToPathSegment;
use AsposeSlidesCloud::Object::LineToPathSegment;
use AsposeSlidesCloud::Object::ClosePathSegment;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'shape add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Shape->new();
      $dto->{shape_type} = "Callout1";
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'shape empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Shape->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("Shape with undefined type should not have been created");
    }
    pass();
};

subtest 'graphical object empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::GraphicalObject->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("GraphicalObject should not have been created");
    }
    pass();
};

subtest 'picture frame add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::PictureFrame->new();
      my $fill = AsposeSlidesCloud::Object::PictureFill->new();
      $fill->{base64_data} = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXY5g+ffp/AAZTAsWGL27gAAAAAElFTkSuQmCC";
      $dto->{picture_fill_format} = $fill;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::PictureFrame");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'picture frame empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::PictureFrame->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("PictureFrame with undefined data should not have been created");
    }
    pass();
};

subtest 'audio frame add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::AudioFrame->new();
      $dto->{base64_data} = "bXAzc2FtcGxl";
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::AudioFrame");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'audio frame empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::AudioFrame->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("AudioFrame with undefined data should not have been created");
    }
    pass();
};

subtest 'video frame add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::VideoFrame->new();
      $dto->{base64_data} = "bXAzc2FtcGxl";
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::VideoFrame");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'video frame empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::VideoFrame->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("VideoFrame with undefined data should not have been created");
    }
    pass();
};

subtest 'ole object frame empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::OleObjectFrame->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("OleObjectFrame should not have been created");
    }
    pass();
};

subtest 'smart art add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::SmartArt->new();
      $dto->{x} = 0;
      $dto->{y} = 0;
      $dto->{width} = 300;
      $dto->{height} = 200;
      $dto->{layout} = 'BasicProcess';
      $dto->{quick_style} = 'SimpleFill';
      $dto->{color_style} = 'ColoredFillAccent1';
      my $node1 = AsposeSlidesCloud::Object::SmartArtNode->new();
      $node1->{text} = "First";
      $node1->{org_chart_layout} = 'Initial';
      my $sub_node1 = AsposeSlidesCloud::Object::SmartArtNode->new();
      $sub_node1->{text} = "SubFirst";
      $sub_node1->{org_chart_layout} = 'Initial';
      my @sub_nodes = ( $sub_node1 );
      $node1->{nodes} = \@sub_nodes;
      my $node2 = AsposeSlidesCloud::Object::SmartArtNode->new();
      $node2->{text} = "Second";
      $node2->{org_chart_layout} = 'Initial';
      my @nodes = ( $node1, $node2 );
      $dto->{nodes} = \@nodes;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::SmartArt");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'smart art empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::SmartArt->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::SmartArt");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'chart empty' => sub { #See Chart tests for non-empty chart examples
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Chart->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Chart");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'table add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Table->new();
      $dto->{x} = 30;
      $dto->{y} = 20;
      $dto->{style} = 'MediumStyle2Accent1';
      my $row1 = AsposeSlidesCloud::Object::TableRow->new();
      my $cell11 = AsposeSlidesCloud::Object::TableCell->new();
      $cell11->{text} = "0.1";
      my $cell12 = AsposeSlidesCloud::Object::TableCell->new();
      $cell12->{text} = "0.2";
      my $cell13 = AsposeSlidesCloud::Object::TableCell->new();
      $cell13->{text} = "0.3";
      my $cell14 = AsposeSlidesCloud::Object::TableCell->new();
      $cell14->{text} = "0.4";
      my @cells1 = ( $cell11, $cell12, $cell13, $cell14 );
      $row1->{cells} = \@cells1;
      my $row2 = AsposeSlidesCloud::Object::TableRow->new();
      my $cell21 = AsposeSlidesCloud::Object::TableCell->new();
      $cell21->{text} = "1";
      my $cell22 = AsposeSlidesCloud::Object::TableCell->new();
      $cell22->{text} = "2-3";
      $cell22->{col_span} = 2;
      $cell22->{row_span} = 2;
      my $cell24 = AsposeSlidesCloud::Object::TableCell->new();
      $cell24->{text} = "4";
      my @cells2 = ( $cell21, $cell22, $cell24 );
      $row2->{cells} = \@cells2;
      my $row3 = AsposeSlidesCloud::Object::TableRow->new();
      my $cell31 = AsposeSlidesCloud::Object::TableCell->new();
      $cell31->{text} = "first";
      my $cell32 = AsposeSlidesCloud::Object::TableCell->new();
      $cell32->{text} = "last";
      my @cells3 = ( $cell31, $cell32 );
      $row3->{cells} = \@cells3;
      my $row4 = AsposeSlidesCloud::Object::TableRow->new();
      my $cell41 = AsposeSlidesCloud::Object::TableCell->new();
      $cell41->{text} = "3.1";
      my $cell42 = AsposeSlidesCloud::Object::TableCell->new();
      $cell42->{text} = "3.2";
      my $cell43 = AsposeSlidesCloud::Object::TableCell->new();
      $cell43->{text} = "3.3";
      my $cell44 = AsposeSlidesCloud::Object::TableCell->new();
      $cell44->{text} = "3.4";
      my @cells4 = ( $cell41, $cell42, $cell43, $cell44 );
      $row4->{cells} = \@cells4;
      my $row5 = AsposeSlidesCloud::Object::TableRow->new();
      my $cell51 = AsposeSlidesCloud::Object::TableCell->new();
      $cell51->{text} = "4.1";
      my $cell52 = AsposeSlidesCloud::Object::TableCell->new();
      $cell52->{text} = "4.2";
      my $cell53 = AsposeSlidesCloud::Object::TableCell->new();
      $cell53->{text} = "4.3";
      my $cell54 = AsposeSlidesCloud::Object::TableCell->new();
      $cell54->{text} = "4.4";
      my @cells5 = ( $cell51, $cell52, $cell53, $cell54 );
      $row5->{cells} = \@cells5;
      my @rows = ( $row1, $row2, $row3, $row4, $row5 );
      $dto->{rows} = \@rows;
      my $column1 = AsposeSlidesCloud::Object::TableColumn->new();
      $column1->{width} = 100;
      my $column2 = AsposeSlidesCloud::Object::TableColumn->new();
      $column2->{width} = 100;
      my $column3 = AsposeSlidesCloud::Object::TableColumn->new();
      $column3->{width} = 100;
      my $column4 = AsposeSlidesCloud::Object::TableColumn->new();
      $column4->{width} = 100;
      my @columns = ( $column1, $column2, $column3, $column4 );
      $dto->{columns} = \@columns;
      $dto->{first_row} = 1;
      $dto->{horizontal_banding} = 1;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Table");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'table empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Table->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->create_shape(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 400);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("Table with undefinined cell data should not have been created");
    }
    pass();
};

subtest 'group shape empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::GroupShape->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::GroupShape");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'connector add' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Connector->new();
      $dto->{shape_type} = 'BentConnector3';
      my $start_shape = AsposeSlidesCloud::Object::ResourceUri->new();
      $start_shape->{href} = "https://api.aspose.cloud/v3.0/slides/myPresentation.pptx/slides/1/shapes/1";
      $dto->{start_shape_connected_to} = $start_shape;
      my $end_shape = AsposeSlidesCloud::Object::ResourceUri->new();
      $end_shape->{href} = "https://api.aspose.cloud/v3.0/slides/myPresentation.pptx/slides/1/shapes/2";
      $dto->{end_shape_connected_to} = $end_shape;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Connector");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'connector empty' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Connector->new();
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->create_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Connector");
    };
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};

subtest 'shapes align' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $slide_index = 3;
      my $shape1_index = 1;
      my $shape2_index = 2;
      my $dto = AsposeSlidesCloud::Object::Connector->new();
      my %params1 = ('name' => "test.pptx", 'slide_index' => $slide_index, 'shape_index' => $shape1_index, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape1 = $utils->{api}->get_shape(%params1);
      my %params2 = ('name' => "test.pptx", 'slide_index' => $slide_index, 'shape_index' => $shape2_index, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape2 = $utils->{api}->get_shape(%params2);
      ok(abs($shape1->{x} - $shape2->{x}) > 1);

      my %params = ('name' => "test.pptx", 'slide_index' => $slide_index, 'alignment_type' => "AlignTop", 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->align_shapes(%params);
      $shape1 = $utils->{api}->get_shape(%params1);
      $shape2 = $utils->{api}->get_shape(%params2);
      ok(abs($shape1->{x} - $shape2->{x}) > 1);
      ok(abs($shape1->{y} - $shape2->{y}) < 1);

      my @shapes = ( 1, 2 );
      %params = ('name' => "test.pptx", 'slide_index' => $slide_index, 'alignment_type' => "AlignLeft", 'align_to_slide' => 1, 'shapes' => \@shapes, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->align_shapes(%params);
      $shape1 = $utils->{api}->get_shape(%params1);
      $shape2 = $utils->{api}->get_shape(%params2);
      ok(abs($shape1->{x} - $shape2->{x}) < 1);
      ok(abs($shape1->{x}) < 1);
      ok(abs($shape1->{y} - $shape2->{y}) < 1);
    };
    if ($@) {
        fail("align_shapes raised an exception: $@");
    }
    pass();
};

subtest 'shapes align group' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $slide_index = 1;
      my $shape1_index = 1;
      my $shape2_index = 2;
      my $path = "4/shapes";
      my $dto = AsposeSlidesCloud::Object::Connector->new();
      my %params1 = ('name' => "test.pptx", 'slide_index' => $slide_index, 'shape_index' => $shape1_index, 'path' => $path, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape1 = $utils->{api}->get_subshape(%params1);
      my %params2 = ('name' => "test.pptx", 'slide_index' => $slide_index, 'shape_index' => $shape2_index, 'path' => $path, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape2 = $utils->{api}->get_subshape(%params2);
      ok(abs($shape1->{x} - $shape2->{x}) > 1);

      my %params = ('name' => "test.pptx", 'slide_index' => $slide_index, 'alignment_type' => "AlignTop", 'path' => $path, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->align_subshapes(%params);
      $shape1 = $utils->{api}->get_subshape(%params1);
      $shape2 = $utils->{api}->get_subshape(%params2);
      ok(abs($shape1->{x} - $shape2->{x}) > 1);
      ok(abs($shape1->{y} - $shape2->{y}) < 1);

      my @shapes = ( 1, 2 );
      %params = ('name' => "test.pptx", 'slide_index' => $slide_index, 'alignment_type' => "AlignLeft", 'path' => $path, 'align_to_slide' => 1, 'shapes' => \@shapes, 'password' => "password", 'folder' => "TempSlidesSDK");
      $utils->{api}->align_subshapes(%params);
      $shape1 = $utils->{api}->get_subshape(%params1);
      $shape2 = $utils->{api}->get_subshape(%params2);
      ok(abs($shape1->{x} - $shape2->{x}) < 1);
      ok(abs($shape1->{x}) < 1);
      ok(abs($shape1->{y} - $shape2->{y}) < 1);
    };
    if ($@) {
        fail("align_subshapes raised an exception: $@");
    }
    pass();
};

subtest 'shapes geometry set' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::GeometryPaths->new();
      my $path = AsposeSlidesCloud::Object::GeometryPath->new();
      my $start_segment = AsposeSlidesCloud::Object::MoveToPathSegment->new();
      $start_segment->{x} = 0;
      $start_segment->{y} = 0;
      my $line1 = AsposeSlidesCloud::Object::LineToPathSegment->new();
      $line1->{x} = 0;
      $line1->{y} = 200;
      my $line2 = AsposeSlidesCloud::Object::LineToPathSegment->new();
      $line2->{x} = 200;
      $line2->{y} = 300;
      my $line3 = AsposeSlidesCloud::Object::LineToPathSegment->new();
      $line3->{x} = 400;
      $line3->{y} = 200;
      my $line4 = AsposeSlidesCloud::Object::LineToPathSegment->new();
      $line4->{x} = 400;
      $line4->{y} = 0;
      my $end_segment = AsposeSlidesCloud::Object::ClosePathSegment->new();
      my @path_data = ( $start_segment, $line1, $line2, $line3, $line4, $end_segment );
      $path->{path_data} = \@path_data;
      my @path = ( $path );
      $dto->{paths} = \@path;
      my %params = ('name' => "test.pptx", 'slide_index' => 4, 'shape_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{api}->set_shape_geometry_path(%params);
      ok($shape);
    };
    if ($@) {
        fail("set_shape_geometry_path raised an exception: $@");
    }
    pass();
};

done_testing;
