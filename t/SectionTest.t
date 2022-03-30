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

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'sections get' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->get_sections(%params);
      is(scalar @{$result->{section_list}}, 3);
    };
    if ($@) {
        fail("get_sections raised an exception: $@");
    }
    pass();
};

subtest 'sections replace' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $dto = AsposeSlidesCloud::Object::Sections->new();
      my $section1 = AsposeSlidesCloud::Object::Section->new();
      $section1->{name} = "Section1";
      $section1->{first_slide_index} = 1;
      my $section2 = AsposeSlidesCloud::Object::Section->new();
      $section2->{name} = "Section2";
      $section2->{first_slide_index} = 3;
      my @section_list = ( $section1, $section2 );
      $dto->{section_list} = \@section_list;
      my %params = ('name' => "test.pptx", 'sections' => $dto, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->set_sections(%params);
      is(scalar @{$result->{section_list}}, @{$dto->{section_list}});
      is(scalar @{$result->{section_list}[0]{slide_list}}, $section2->{first_slide_index} - $section1->{first_slide_index});
    };
    if ($@) {
        fail("set_sections raised an exception: $@");
    }
    pass();
};

subtest 'sections post' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'section_name' => "NewSection", 'slide_index' => 5, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->create_section(%params);
      is(scalar @{$result->{section_list}}, 4);
    };
    if ($@) {
        fail("create_section raised an exception: $@");
    }
    pass();
};

subtest 'sections put' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my $section_index = 2;
      my $section_name = "UpdatedSection";
      my %params = ('name' => "test.pptx", 'section_index' => $section_index, 'section_name' => $section_name, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->update_section(%params);
      is(scalar @{$result->{section_list}}, 3);
      is($result->{section_list}[$section_index - 1]{name}, $section_name);
    };
    if ($@) {
        fail("update_section raised an exception: $@");
    }
    pass();
};

subtest 'sections move' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'section_index' => 1, 'new_position' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->move_section(%params);
      is(scalar @{$result->{section_list}}, 3);
    };
    if ($@) {
        fail("move_section raised an exception: $@");
    }
    pass();
};

subtest 'sections clear' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->delete_sections(%params);
      is(scalar @{$result->{section_list}}, 0);
    };
    if ($@) {
        fail("delete_sections raised an exception: $@");
    }
    pass();
};

subtest 'sections delete many' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my @sections = ( 2, 3 );
      my %params = ('name' => "test.pptx", 'sections' => \@sections, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->delete_sections(%params);
      is(scalar @{$result->{section_list}}, 1);
    };
    if ($@) {
        fail("delete_sections raised an exception: $@");
    }
    pass();
};

subtest 'sections delete' => sub {
    eval {
      my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
      $utils->{api}->copy_file(%copy_params);

      my %params = ('name' => "test.pptx", 'section_index' => 2, 'password' => "password", 'folder' => "TempSlidesSDK");
      my $result = $utils->{api}->delete_section(%params);
      is(scalar @{$result->{section_list}}, 2);
    };
    if ($@) {
        fail("delete_section raised an exception: $@");
    }
    pass();
};

done_testing;
