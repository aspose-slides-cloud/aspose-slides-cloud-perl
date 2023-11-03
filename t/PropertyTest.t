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
use AsposeSlidesCloud::Object::DocumentProperty;
use AsposeSlidesCloud::Object::SlideProperties;
use AsposeSlidesCloud::Object::ProtectionProperties;
use AsposeSlidesCloud::Object::ViewProperties;
use AsposeSlidesCloud::Object::SlideShowProperties;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'properties builtin' => sub {
    eval {
      my $property_name = "Author";
      my $updated_property_value = "New Value";
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'property_name' => $property_name, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->get_document_property(%params);
      is($result->{name}, $property_name);
      ok($result->{built_in});

      my $property = AsposeSlidesCloud::Object::DocumentProperty->new();
      $property->{value} = $updated_property_value;
      my %set_params = ('name' => "test.pptx", 'property_name' => $property_name, 'property' => $property, 'password' => "password", 'folder' => "TempSlidesSDK");
      $result = $utils->{testSlidesApi}->set_document_property(%set_params);
      is($result->{name}, $property_name);
      is($result->{value}, $updated_property_value);
      ok($result->{built_in});

      $utils->{testSlidesApi}->delete_document_property(%params);
      $result = $utils->{testSlidesApi}->get_document_property(%params);
      #built-in property is not actually deleted
      is($result->{name}, $property_name);
      ok($result->{value} ne $updated_property_value);
      ok($result->{built_in});
    };
    if ($@) {
        fail("get_document_property raised an exception: $@");
    }
    pass();
};

subtest 'properties custom' => sub {
    my $property_name = "CustomProperty2";
    my %params = ('name' => "test.pptx", 'property_name' => $property_name, 'password' => "password", 'folder' => "TempSlidesSDK");
    eval {
      my $updated_property_value = "New Value";
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $property = AsposeSlidesCloud::Object::DocumentProperty->new();
      $property->{value} = $updated_property_value;
      my %set_params = ('name' => "test.pptx", 'property_name' => $property_name, 'property' => $property, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->set_document_property(%set_params);
      is($result->{name}, $property_name);
      is($result->{value}, $updated_property_value);
      ok(not $result->{built_in});

      $utils->{testSlidesApi}->delete_document_property(%params);
    };
    if ($@) {
        fail("get_document_property raised an exception: $@");
    }
    eval {
      $utils->{testSlidesApi}->get_document_property(%params);
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 404);
        } else {
            fail("Invalid exception type: $@");
        }
    } else {
        fail("The property must have been deleted");
    }
    pass();
};

subtest 'properties bulk update' => sub {
    eval {
      my $property_name = "Author";
      my $custom_property_name = "CustomProperty2";
      my $updated_property_value = "New Value";
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->get_document_properties(%params);
      my $count = scalar @{$result->{list}};

      my $property1 = AsposeSlidesCloud::Object::DocumentProperty->new();
      $property1->{name} = $property_name;
      $property1->{value} = $updated_property_value;
      my $property2 = AsposeSlidesCloud::Object::DocumentProperty->new();
      $property2->{name} = $custom_property_name;
      $property2->{value} = $updated_property_value;
      my $properties = AsposeSlidesCloud::Object::DocumentProperties->new();
      my @properties_list = ( $property1, $property2 );
      $properties->{list} = \@properties_list;
      my %set_params = ('name' => "test.pptx", 'properties' => $properties, 'password' => "password", 'folder' => "TempSlidesSDK");
      $result = $utils->{testSlidesApi}->set_document_properties(%set_params);
      is(scalar @{$result->{list}}, $count + 1);

      $result = $utils->{testSlidesApi}->delete_document_properties(%params);
      is(scalar @{$result->{list}}, $count - 1);
    };
    if ($@) {
        fail("get_document_properties raised an exception: $@");
    }
};

subtest 'properties slide' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $get_result = $utils->{testSlidesApi}->get_slide_properties(%params);

      my $dto = AsposeSlidesCloud::Object::SlideProperties->new();
      $dto->{first_slide_number} = $get_result->{first_slide_number} + 2;
      my %set_params = ('name' => "test.pptx", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $put_result = $utils->{testSlidesApi}->set_slide_properties(%set_params);
      is($put_result->{orientation}, $get_result->{orientation});
      ok($put_result->{first_slide_number} ne $get_result->{first_slide_number});
    };
    if ($@) {
        fail("get_slide_properties raised an exception: $@");
    }
};

subtest 'properties slide size preset' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::SlideProperties->new();
      $dto->{size_type} = 'B4IsoPaper';
      my %set_params = ('name' => "test.pptx", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->set_slide_properties(%set_params);
      is($result->{size_type}, 'B4IsoPaper');
      is($result->{width}, 852);
      is($result->{height}, 639);
    };
    if ($@) {
        fail("set_slide_properties raised an exception: $@");
    }
};

subtest 'properties slide size custom' => sub {
    eval {
      my $width = 800;
      my $height = 500;
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::SlideProperties->new();
      $dto->{width} = $width;
      $dto->{height} = $height;
      my %set_params = ('name' => "test.pptx", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->set_slide_properties(%set_params);
      is($result->{size_type}, 'Custom');
      is($result->{width}, $width);
      is($result->{height}, $height);
    };
    if ($@) {
        fail("set_slide_properties raised an exception: $@");
    }
};

subtest 'properties protection' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $get_result = $utils->{testSlidesApi}->get_protection_properties(%params);

      my $dto = AsposeSlidesCloud::Object::ProtectionProperties->new();
      $dto->{read_only_recommended} = ($get_result->{read_only_recommended} ? "false" : "true");
      $params{dto} = $dto;
      my $put_result = $utils->{testSlidesApi}->set_protection(%params);
      is($put_result->{encrypt_document_properties}, $get_result->{encrypt_document_properties});
      ok($put_result->{read_only_recommended} ne $get_result->{read_only_recommended});
    };
    if ($@) {
        fail("get_protection_properties raised an exception: $@");
    }
};

subtest 'properties protection delete' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->delete_protection(%params);
      ok(not $result->{is_encrypted});
      ok(not $result->{read_only_recommended});
      ok(not $result->{read_password});
    };
    if ($@) {
        fail("delete_protection raised an exception: $@");
    }
};

subtest 'properties protection online' => sub {
    eval {
      my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
      my $dto = AsposeSlidesCloud::Object::ProtectionProperties->new();
      $dto->{read_password} = "newPassword";
      my %params = ('document' => $source, 'dto' => $dto, 'password' => "password");
      my $result = $utils->{testSlidesApi}->set_protection_online(%params);
      ok(length($source) > 0);
    };
    if ($@) {
        fail("set_protection_online raised an exception: $@");
    }
};

subtest 'properties unprotect online' => sub {
    eval {
      my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
      my %params = ('document' => $source, 'password' => "password");
      my $result = $utils->{testSlidesApi}->delete_protection_online(%params);
      ok(length($result) ne length($source));
    };
    if ($@) {
        fail("delete_protection_online raised an exception: $@");
    }
};

subtest 'get view properties' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->get_view_properties(%params);
      is($result -> {show_comments}, 'True');
    };
    if ($@) {
        fail("get_view_properties raised an exception: $@");
    }
};

subtest 'set view properties' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::ViewProperties->new();
      my $common_slide_view_properties = AsposeSlidesCloud::Object::CommonSlideViewProperties->new();
      $common_slide_view_properties->{scale} = 50;
      $dto->{show_comments} = 'False';
      $dto->{slide_view_properties} = $common_slide_view_properties;


      my %params = ('name' => "test.pptx", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->set_view_properties(%params);
      is($result -> {show_comments}, 'False');
      is($result -> {slide_view_properties} -> {scale}, 50);
    };
    if ($@) {
        fail("set_view_properties raised an exception: $@");
    }
};

subtest 'protection check' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->get_protection_properties(%params);
      is($result -> {is_encrypted}, 1);
      is($result -> {read_password}, undef);

      %params = ('name' => "test.pptx", 'password' => 'password', 'folder' => "TempSlidesSDK");
      $result = $utils->{testSlidesApi}->get_protection_properties(%params);
      is($result -> {is_encrypted}, 1);
      is($result -> {read_password}, 'password');
    };
    if ($@) {
        fail("get_protection_properties raised an exception: $@");
    }
};

subtest 'get slide show properties' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->get_slide_show_properties(%params);
      is($result -> {show_animation}, 1);
      is($result -> {show_narration}, 1);
    };
    if ($@) {
        fail("get_slide_show_properties raised an exception: $@");
    }
};

subtest 'set slide show properties' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{testSlidesApi}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::SlideShowProperties->new();
      $dto->{loop} = 1;
      $dto->{use_timings} = 1;
      $dto->{slide_show_type} = "PresentedBySpeaker";


      my %params = ('name' => "test.pptx", 'dto' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{testSlidesApi}->set_slide_show_properties(%params);
      is($result -> {loop}, $dto->{loop});
      is($result -> {use_timings}, $dto->{use_timings});
      is($result -> {slide_show_type}, $dto->{slide_show_type});
    };
    if ($@) {
        fail("set_slide_show_properties raised an exception: $@");
    }
};

done_testing;
