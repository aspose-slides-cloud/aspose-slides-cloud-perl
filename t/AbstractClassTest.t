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
use AsposeSlidesCloud::Object::Chart;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();


subtest 'subclass property deserialization' => sub {
    $utils->initialize('get_slide_shape', '');
    my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'shape_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
    eval {
        my $result = $utils->{api}->get_shape(%params);
        is($result->{text}, "1");
    };
    if ($@) {
        fail("post_slides_pipeline raised an exception: $@");
    }
    pass();
};

subtest 'chart initialization' => sub {
    my $chart = AsposeSlidesCloud::Object::Chart->new();
    is($chart->{type}, "Chart");
};

done_testing;