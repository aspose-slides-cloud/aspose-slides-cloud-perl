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
use JSON;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::PdfExportOptions;
use AsposeSlidesCloud::Object::PdfImportOptions;
use AsposeSlidesCloud::Object::ImageExportOptions;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'create empty' => sub {
    $utils->initialize('create_presentation', '');
    eval {
        my %params = ('path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->delete_file(%params);

        %params = ('name' => "test.pptx", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_presentation(%params);
    };
    if ($@) {
        fail("create_presentation raised an exception: $@");
    }
    pass();
};

subtest 'create from request' => sub {
    $utils->initialize('create_presentation', '');
    eval {
        my %params = ('path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->delete_file(%params);

        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        %params = ('name' => "test.pptx", 'source' => $source, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_presentation(%params);
    };
    if ($@) {
        fail("create_presentation raised an exception: $@");
    }
    pass();
};

subtest 'create from storage' => sub {
    $utils->initialize('create_presentation_from_source', '');
    eval {
        my %params = ('path' => "TempSlidesSDK/test2.pptx");
        $utils->{testSlidesApi}->delete_file(%params);

        %params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%params);

        %params = ('name' => "test2.pptx", 'source_path' => "TempSlidesSDK/test.pptx", 'source_password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_presentation_from_source(%params);
    };
    if ($@) {
        fail("create_presentation_from_source raised an exception: $@");
    }
    pass();
};

subtest 'create from template' => sub {
    $utils->initialize('create_presentation_from_template', '');
    eval {
        my %params = ('path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->delete_file(%params);

        %params = ('src_path' => "TempTests/TemplateCV.pptx", 'dest_path' => "TempSlidesSDK/TemplateCV.pptx");
        $utils->{testSlidesApi}->copy_file(%params);

        my $data = "<staff><person><name>John Doe</name><address><line1>10 Downing Street</line1><line2>London</line2></address><phone>+457 123456</phone><bio>Hi, I'm John and this is my CV</bio><skills><skill><title>C#</title><level>Excellent</level></skill><skill><title>C++</title><level>Good</level></skill><skill><title>Java</title><level>Average</level></skill></skills></person></staff>";
        %params = ('name' => "test.pptx", 'template_path' => "TempSlidesSDK/TemplateCV.pptx", 'data' => $data, 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->create_presentation_from_template(%params);
    };
    if ($@) {
        fail("create_presentation_from_template raised an exception: $@");
    }
    pass();
};

subtest 'create from HTML' => sub {
    $utils->initialize('import_from_html', '');
    eval {
        my %params = ('path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->delete_file(%params);

        %params = ('name' => "test.pptx", 'html' => "<html><body>New Content</body></html>", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->import_from_html(%params);
    };
    if ($@) {
        fail("import_from_html raised an exception: $@");
    }
    pass();
};

subtest 'append from HTML' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %get_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->get_slides(%get_params);
        my $slide_count = scalar @{$result->{slide_list}};

        my %post_params = ('name' => "test.pptx", 'html' => "<html><body>New Content</body></html>", 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->import_from_html(%post_params);

        %get_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        $result = $utils->{testSlidesApi}->get_slides(%get_params);
        my $new_slide_count = scalar @{$result->{slide_list}};
        is($new_slide_count, $slide_count + 1);
    };
    if ($@) {
        fail("import_from_html raised an exception: $@");
    }
    pass();
};

subtest 'create from PDF' => sub {
    eval {
        my %params = ('path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->delete_file(%params);

        my $source = read_file("TestData/test.pdf", { binmode => ':raw' });
        %params = ('name' => "test.pptx", 'pdf' => $source, 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->import_from_pdf(%params);
    };
    if ($@) {
        fail("import_from_pdf raised an exception: $@");
    }
    pass();
};

subtest 'append from PDF' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %get_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        my $result = $utils->{testSlidesApi}->get_slides(%get_params);
        my $slide_count = scalar @{$result->{slide_list}};

        my $source = read_file("TestData/test.pdf", { binmode => ':raw' });
        my $options = AsposeSlidesCloud::Object::PdfImportOptions->new();
        $options->{detect_tables} = 0;
        my %post_params = ('name' => "test.pptx", 'pdf' => $source, 'options' => $options, 'password' => "password", 'folder' => "TempSlidesSDK");
        $utils->{testSlidesApi}->import_from_pdf(%post_params);

        %get_params = ('name' => "test.pptx", 'password' => "password", 'folder' => "TempSlidesSDK");
        $result = $utils->{testSlidesApi}->get_slides(%get_params);
        my $new_slide_count = scalar @{$result->{slide_list}};
        is($new_slide_count, $slide_count + 4);
    };
    if ($@) {
        fail("import_from_pdf raised an exception: $@");
    }
    pass();
};

done_testing;
