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
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::TextFrameFormat;
use AsposeSlidesCloud::Object::ThreeDFormat;
use AsposeSlidesCloud::Object::ShapeBevel;
use AsposeSlidesCloud::Object::LightRig;
use AsposeSlidesCloud::Object::Camera;

use Test::More;
use Test::Exception;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'text format 3d' => sub {
    eval {
		my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my $dto = AsposeSlidesCloud::Object::Shape->new();
        $dto->{shape_type} = 'Rectangle';
        $dto->{x} = 100;
        $dto->{y} = 100;
        $dto->{height} = 100;
        $dto->{width} = 200;
        $dto->{text} = 'Sample text';

        my $text_frame_format = AsposeSlidesCloud::Object::TextFrameFormat->new();
        $text_frame_format->{transform} = 'ArchUpPour';
        my $three_d_format = AsposeSlidesCloud::Object::ThreeDFormat->new();
        $three_d_format->{extrusion_color} = '#FF008000';
        $three_d_format->{extrusion_height} = 6;
        $three_d_format->{contour_color} = '#FF25353D';
        $three_d_format->{contour_width} = 1.5;
        $three_d_format->{depth} = 3;
        $three_d_format->{material} = 'Plastic';

        my $bevel_bottom = AsposeSlidesCloud::Object::ShapeBevel->new();
        $bevel_bottom->{bevel_type} = 'Circle';
        $bevel_bottom->{height} = 3.5;
        $bevel_bottom->{width} = 3.5;
        my $bevel_top = AsposeSlidesCloud::Object::ShapeBevel->new();
        $bevel_top->{bevel_type} = 'Circle';
        $bevel_top->{height} = 4;
        $bevel_top->{width} = 4;
        $three_d_format->{bevel_bootom} = $bevel_bottom;
        $three_d_format->{bevel_top} = $bevel_top;

        my $light_rig = AsposeSlidesCloud::Object::LightRig->new();
        $light_rig->{light_type} = 'Balanced';
        $light_rig->{direction} = 'top';
        $light_rig->{x_rotation} = 0;
        $light_rig->{y_rotation} = 0;
        $light_rig->{z_rotation} = 40;
        $three_d_format->{light_rig} = $light_rig;

        my $camera = AsposeSlidesCloud::Object::Camera->new();
        $camera->{camera_type} = 'PerspectiveContrastingRightFacing';
        $three_d_format->{camera} = $camera;

        $text_frame_format->{three_d_format} = $three_d_format;
        $dto->{text_frame_format} = $text_frame_format;

        my %params = (
            'name' => "test.pptx", 
            'slide_index' => 1,
            'dto' => $dto,
            'password' => "password", 
            'folder' => "TempSlidesSDK");

        my $response = $utils->{api}->create_shape(%params);
        is ($response->{type}, 'Shape');

	};
    if ($@) {
        fail("create_shape raised an exception: $@");
    }
    pass();
};


done_testing;