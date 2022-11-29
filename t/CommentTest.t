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
use JSON;

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::TestUtils;
use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::Object::SlideComment;
use AsposeSlidesCloud::Object::SlideModernComment;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'create comment' => sub {
    $utils->initialize('create_comment', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);
        
        my $comment_text = 'Comment text';
        my $author = 'author';
        my $child_comment_text = 'Child comment';

        my $child_comment = AsposeSlidesCloud::Object::SlideComment->new();
        $child_comment->{text} = $child_comment_text;
        $child_comment->{author} = $author;

        my $comment = AsposeSlidesCloud::Object::SlideComment->new();
        $comment->{text} = $comment_text;
        $comment->{author} = $author;
        my @child_comments = ($child_comment);
        $comment->{child_comments} = \@child_comments;

		my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'dto' => $comment, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{api}->create_comment(%params);

        is(scalar @{$response->{list}}, 1);
        is($response->{list}[0]{text}, $comment_text);
        is($response->{list}[0]{author}, $author);
        is($response->{list}[0]{child_comments}[0]{text}, $child_comment_text);
        is($response->{list}[0]{child_comments}[0]{author}, $author);
	};
    if ($@) {
        fail("create_comment raised an exception: $@");
    }
    pass();
};

subtest 'create comment online' => sub {
    $utils->initialize('create_comment', '');
    eval {
        my $comment_text = 'Comment text';
        my $author = 'author';
        my $child_comment_text = 'Child comment';

        my $child_comment = AsposeSlidesCloud::Object::SlideComment->new();
        $child_comment->{text} = $child_comment_text;
        $child_comment->{author} = $author;

        my $comment = AsposeSlidesCloud::Object::SlideComment->new();
        $comment->{text} = $comment_text;
        $comment->{author} = $author;
        my @child_comments = ($child_comment);
        $comment->{child_comments} = \@child_comments;

        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
		my %params = ('document' => $source, 'slide_index' => 3, 'dto' => $comment, 'password' => 'password');
        my $response = $utils->{api}->create_comment_online(%params);

        ok(length($response) > length($source));
	};
    if ($@) {
        fail("create_comment_online raised an exception: $@");
    }
    pass();
};

subtest 'get slide comments' => sub {
    $utils->initialize('get_slide_comments', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{api}->get_slide_comments(%params);

        is(scalar @{$response->{list}}, 2);
        is(scalar @{$response->{list}[0]{child_comments}}, 1);
	};
    if ($@) {
        fail("get_slide_comments raised an exception: $@");
    }
    pass();
};

subtest 'delete comments' => sub {
    $utils->initialize('delete_comments', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{api}->delete_comments(%params);

        is(scalar @{$response->{list}}, 0);
	};
    if ($@) {
        fail("delete_comments raised an exception: $@");
    }
    pass();
};

subtest 'delete comments online' => sub {
    $utils->initialize('delete_comments_online', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'password' => 'password');
        my $response = $utils->{api}->delete_comments_online(%params);
        ok(length($response) < length($source));
	};
    if ($@) {
        fail("delete_comments_online raised an exception: $@");
    }
    pass();
};

subtest 'delete slide comments' => sub {
    $utils->initialize('delete_slide_comments', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);

		my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{api}->delete_slide_comments(%params);
        is(scalar @{$response->{list}}, 0);
	};
    if ($@) {
        fail("delete_slide_comments raised an exception: $@");
    }
    pass();
};

subtest 'delete slide comments online' => sub {
    $utils->initialize('delete_slide_comments_online', '');
    eval {
        my $source = read_file("TestData/test.pptx", { binmode => ':raw' });
        my %params = ('document' => $source, 'slide_index' => 1, 'password' => 'password');
        my $response = $utils->{api}->delete_slide_comments_online(%params);
        ok(length($response) != length($source));
	};
    if ($@) {
        fail("delete_slide_comments_online raised an exception: $@");
    }
    pass();
};

subtest 'create modern comment' => sub {
    $utils->initialize('create_modern_comment', '');
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);
        
        my $text_selection_start_index = 1;
        my $text_selection_length = 5;

        my $comment_text = 'Comment text';
        my $author = 'author';
        my $child_comment_text = 'Child comment';

        my $child_comment = AsposeSlidesCloud::Object::SlideModernComment->new();
        $child_comment->{text} = $child_comment_text;
        $child_comment->{author} = $author;
        $child_comment->{status} = 'Resolved';

        my $comment = AsposeSlidesCloud::Object::SlideModernComment->new();
        $comment->{text} = $comment_text;
        $comment->{author} = $author;
        $comment->{text_selection_start_index} = $text_selection_start_index;
        $comment->{text_selection_length} = $text_selection_length;
        $comment->{status} = 'Active';
        my @child_comments = ($child_comment);
        $comment->{child_comments} = \@child_comments;

		my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'dto' => $comment, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{api}->create_comment(%params);

        is(scalar @{$response->{list}}, 1);
        is($response->{list}[0]{type}, 'Modern');
	};
    if ($@) {
        fail("create modern comment raised an exception: $@");
    }
    pass();
};

subtest 'create shape modern comment' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{api}->copy_file(%copy_params);
        
        my $text_selection_start_index = 1;
        my $text_selection_length = 5;

        my $comment_text = 'Comment text';
        my $author = 'author';
        my $child_comment_text = 'Child comment';

        my $child_comment = AsposeSlidesCloud::Object::SlideModernComment->new();
        $child_comment->{text} = $child_comment_text;
        $child_comment->{author} = $author;
        $child_comment->{status} = 'Resolved';

        my $comment = AsposeSlidesCloud::Object::SlideModernComment->new();
        $comment->{text} = $comment_text;
        $comment->{author} = $author;
        $comment->{text_selection_start_index} = $text_selection_start_index;
        $comment->{text_selection_length} = $text_selection_length;
        $comment->{status} = 'Active';
        my @child_comments = ($child_comment);
        $comment->{child_comments} = \@child_comments;

		my %params = ('name' => 'test.pptx', 'slide_index' => 3, 'dto' => $comment, 'shape_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{api}->create_comment(%params);

        is(scalar @{$response->{list}}, 1);
        is($response->{list}[0]{type}, 'Modern');
	};
    if ($@) {
        fail("create shape modern comment raised an exception: $@");
    }
    pass();
};

done_testing;