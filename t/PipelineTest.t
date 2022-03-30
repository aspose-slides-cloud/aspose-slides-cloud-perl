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
use AsposeSlidesCloud::Object::Pipeline;
use AsposeSlidesCloud::Object::RequestInputFile;
use AsposeSlidesCloud::Object::Save;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'multipart content' => sub {
    $utils->initialize('post_slides_pipeline', '');

    my $pipeline = AsposeSlidesCloud::Object::Pipeline->new();
    my $input = AsposeSlidesCloud::Object::Input->new();
    my $template_data = AsposeSlidesCloud::Object::RequestInputFile->new();
    $template_data->{index} = 0;
    $input->{template_data} = $template_data;
    my $template = AsposeSlidesCloud::Object::RequestInputFile->new();
    $template->{index} = 1;
    $input->{template} = $template;
    $pipeline->{input} = $input;
    my $task = AsposeSlidesCloud::Object::Save->new();
    $task->{format} = "pptx";
    my $output = AsposeSlidesCloud::Object::OutputFile->new();
    $output->{type} = "Response";
    $task->{output} = $output;
    my @tasks = ($task);
    $pipeline->{tasks} = \@tasks;
    my $file1 = read_file("TestData/TemplatingCVDataWithBase64.xml", { binmode => ':raw' });
    my $file2 = read_file("TestData/TemplateCV.pptx", { binmode => ':raw' });
    my @files = ($file1, $file2);
    my %params = ('pipeline' => $pipeline, 'files' => \@files);
    eval {
        my $result = $utils->{api}->pipeline(%params);
    };
    if ($@) {
        fail("post_slides_pipeline raised an exception: $@");
    }
    pass();
};

done_testing;
