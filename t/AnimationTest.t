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
use AsposeSlidesCloud::Object::SlideAnimation;
use AsposeSlidesCloud::Object::Effect;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'animation get' => sub {
    $utils->initialize('get_animation', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->get_animation(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 1);

        %params = ('name' => 'test.pptx', 'slide_index' => 1, 'shape_index' => 3, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        $animation = $utils->{testSlidesApi}->get_animation(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 0);

        %params = ('name' => 'test.pptx', 'slide_index' => 1, 'shape_index' => 3, 'paragraph_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        $animation = $utils->{testSlidesApi}->get_animation(%params);
        is(scalar @{$animation->{main_sequence}}, 0);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation set' => sub {
    $utils->initialize('set_animation', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::SlideAnimation->new();
        my $effect1 = AsposeSlidesCloud::Object::Effect->new();
        $effect1->{type} = "Blink";
        $effect1->{shape_index} = 2;
        $effect1->{paragraph_index} = 1;

        my $effect2 = AsposeSlidesCloud::Object::Effect->new();
        $effect2->{type} = "Box";
        $effect2->{subtype} = "In";
        $effect2->{preset_class_type} = "Entrance";
        $effect2->{shape_index} = 4;
        my @effects = ( $effect1, $effect2 );
        $dto->{main_sequence} = \@effects;

        my @interactiveSequences = ();
        $dto->{interactive_sequences} = \@interactiveSequences;

        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'animation' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->set_animation(%params);
        is(scalar @{$animation->{main_sequence}}, scalar @{$dto->{main_sequence}});
        is(scalar @{$animation->{interactive_sequences}}, 0);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation create effect' => sub {
    $utils->initialize('create_animation_effect', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Effect->new();
        $dto->{type} = "Blast";
        $dto->{shape_index} = 3;
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'effect' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->create_animation_effect(%params);
        is(scalar @{$animation->{main_sequence}}, 2);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation create interactive sequence' => sub {
    $utils->initialize('create_animation_interactive_sequence', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::InteractiveSequence->new();
        $dto->{trigger_shape_index} = 2;
        my $effect = AsposeSlidesCloud::Object::Effect->new();
        $effect->{type} = "Blast";
        $effect->{shape_index} = 3;
        my @effects = ( $effect );
        $dto->{effects} = \@effects;
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'sequence' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->create_animation_interactive_sequence(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 2);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation create interactive sequence effect' => sub {
    $utils->initialize('create_animation_interactive_sequence_effect', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Effect->new();
        $dto->{type} = "Blast";
        $dto->{shape_index} = 3;
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'sequence_index' => 1, 'effect' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->create_animation_interactive_sequence_effect(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation update effect' => sub {
    $utils->initialize('update_animation_effect', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Effect->new();
        $dto->{type} = "Blast";
        $dto->{shape_index} = 3;
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'effect_index' => 1, 'effect' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->update_animation_effect(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation update interactive sequence effect' => sub {
    $utils->initialize('update_animation_interactive_sequence_effect', '');
    eval {
        my $dto = AsposeSlidesCloud::Object::Effect->new();
        $dto->{type} = "Blast";
        $dto->{shape_index} = 3;
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'sequence_index' => 1, 'effect_index' => 1, 'effect' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->update_animation_interactive_sequence_effect(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation delete' => sub {
    $utils->initialize('delete_animation', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->delete_animation(%params);
        is(scalar @{$animation->{main_sequence}}, 0);
        is(scalar @{$animation->{interactive_sequences}}, 0);
    };
    if ($@) {
        fail("get_animation raised an exception: $@");
    }
    pass();
};

subtest 'animation delete main sequence' => sub {
    $utils->initialize('delete_animation_main_sequence', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->delete_animation_main_sequence(%params);
        is(scalar @{$animation->{main_sequence}}, 0);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("delete_animation_main_sequence raised an exception: $@");
    }
    pass();
};

subtest 'animation delete main sequence effect' => sub {
    $utils->initialize('delete_animation_effect', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'effect_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->delete_animation_effect(%params);
        is(scalar @{$animation->{main_sequence}}, 0);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("delete_animation_effect raised an exception: $@");
    }
    pass();
};

subtest 'delete interactive sequences' => sub {
    $utils->initialize('delete_animation_interactive_sequences', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->delete_animation_interactive_sequences(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 0);
    };
    if ($@) {
        fail("delete_animation_interactive_sequences raised an exception: $@");
    }
    pass();
};

subtest 'delete interactive sequence' => sub {
    $utils->initialize('delete_animation_interactive_sequence', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'sequence_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->delete_animation_interactive_sequence(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 0);
    };
    if ($@) {
        fail("delete_animation_interactive_sequence raised an exception: $@");
    }
    pass();
};

subtest 'delete interactive sequence effect' => sub {
    $utils->initialize('delete_animation_interactive_sequence_effect', '');
    eval {
        my %params = ('name' => 'test.pptx', 'slide_index' => 1, 'sequence_index' => 1, 'effect_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $animation = $utils->{testSlidesApi}->delete_animation_interactive_sequence_effect(%params);
        is(scalar @{$animation->{main_sequence}}, 1);
        is(scalar @{$animation->{interactive_sequences}}, 1);
    };
    if ($@) {
        fail("delete_animation_interactive_sequence_effect raised an exception: $@");
    }
    pass();
};

done_testing;
