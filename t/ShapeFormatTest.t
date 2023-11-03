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
use AsposeSlidesCloud::Object::Shape;
use AsposeSlidesCloud::Object::SolidFill;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'shape format line' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Shape->new();
      my $line_format = AsposeSlidesCloud::Object::LineFormat->new();
      $line_format->{style} = "ThickThin";
      $line_format->{width} = 7;
      $line_format->{dash_style} = "Dash";
      $dto->{line_format} = $line_format;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{testSlidesApi}->update_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");

      %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
      $shape = $utils->{testSlidesApi}->get_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");
      is($shape->{line_format}{width}, $dto->{line_format}{width});
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

subtest 'shape format fill' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Shape->new();
      my $fill_format = AsposeSlidesCloud::Object::SolidFill->new();
      $fill_format->{color} = "#FFFFFF00";
      $dto->{fill_format} = $fill_format;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{testSlidesApi}->update_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");

      %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
      $shape = $utils->{testSlidesApi}->get_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");
      is(ref $shape->{fill_format}, "AsposeSlidesCloud::Object::SolidFill");
      is($shape->{fill_format}{color}, $dto->{fill_format}{color});
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

subtest 'shape format effect' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Shape->new();
      my $effect_format = AsposeSlidesCloud::Object::EffectFormat->new();
      my $inner_shadow = AsposeSlidesCloud::Object::InnerShadowEffect->new();
      $inner_shadow->{direction} = 35;
      $inner_shadow->{blur_radius} = 30;
      $inner_shadow->{distance} = 40;
      $inner_shadow->{shadow_color} = "#FFFFFF00";
      $effect_format->{inner_shadow} = $inner_shadow;
      $dto->{effect_format} = $effect_format;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{testSlidesApi}->update_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");

      %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
      $shape = $utils->{testSlidesApi}->get_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");
      is($shape->{effect_format}{inner_shadow}{direction}, $dto->{effect_format}{inner_shadow}{direction});
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

subtest 'shape format 3d' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Shape->new();
      my $three_d_format = AsposeSlidesCloud::Object::ThreeDFormat->new();
      $three_d_format->{depth} = 4;

      my $bevel_top = AsposeSlidesCloud::Object::ShapeBevel->new();
      $bevel_top->{bevel_type} = "Circle";
      $bevel_top->{height} = 6;
      $bevel_top->{width} = 6;
      $three_d_format->{bevel_top} = $bevel_top;

      my $camera = AsposeSlidesCloud::Object::Camera->new();
      $camera->{camera_type} = "OrthographicFront";
      $three_d_format->{camera} = $camera;

      my $light_rig = AsposeSlidesCloud::Object::LightRig->new();
      $light_rig->{light_type} = "ThreePt";
      $light_rig->{direction} = "Top";
      $three_d_format->{light_rig} = $light_rig;
      $dto->{three_d_format} = $three_d_format;
      my %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $shape = $utils->{testSlidesApi}->update_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");

      %params = ('name' => "test.pptx", 'slide_index' => 1, 'shape_index' => 1, 'password' => "password", 'folder' => "TempSlidesSDK");
      $shape = $utils->{testSlidesApi}->get_shape(%params);
      is(ref $shape, "AsposeSlidesCloud::Object::Shape");
      is($shape->{three_d_format}{depth}, $dto->{three_d_format}{depth});
    };
    if ($@) {
        fail("update_shape raised an exception: $@");
    }
    pass();
};

done_testing;
