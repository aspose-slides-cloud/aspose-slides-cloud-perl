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

package AsposeSlidesCloud::Object::Effect;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;


use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Represents comment of slide
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	return $self;
}  

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}


__PACKAGE__->class_documentation({description => 'Represents comment of slide',
                                  class => 'Effect',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'type' => {
    	datatype => 'string',
    	base_name => 'Type',
    	description => 'Effect type.',
    	format => '',
    	read_only => '',
    		},
    'subtype' => {
    	datatype => 'string',
    	base_name => 'Subtype',
    	description => 'Effect subtype.',
    	format => '',
    	read_only => '',
    		},
    'preset_class_type' => {
    	datatype => 'string',
    	base_name => 'PresetClassType',
    	description => 'Preset class type.',
    	format => '',
    	read_only => '',
    		},
    'animate_text_type' => {
    	datatype => 'string',
    	base_name => 'AnimateTextType',
    	description => 'Preset class type.',
    	format => '',
    	read_only => '',
    		},
    'shape_index' => {
    	datatype => 'int',
    	base_name => 'ShapeIndex',
    	description => 'Shape index.',
    	format => '',
    	read_only => '',
    		},
    'paragraph_index' => {
    	datatype => 'int',
    	base_name => 'ParagraphIndex',
    	description => 'Paragraph index.',
    	format => '',
    	read_only => '',
    		},
    'trigger_type' => {
    	datatype => 'string',
    	base_name => 'TriggerType',
    	description => 'Effect trigger type.',
    	format => '',
    	read_only => '',
    		},
    'accelerate' => {
    	datatype => 'double',
    	base_name => 'Accelerate',
    	description => 'The percentage of duration accelerate behavior effect.',
    	format => '',
    	read_only => '',
    		},
    'auto_reverse' => {
    	datatype => 'boolean',
    	base_name => 'AutoReverse',
    	description => 'True to automatically play the animation in reverse after playing it in the forward direction.',
    	format => '',
    	read_only => '',
    		},
    'decelerate' => {
    	datatype => 'double',
    	base_name => 'Decelerate',
    	description => 'The percentage of duration decelerate behavior effect.',
    	format => '',
    	read_only => '',
    		},
    'duration' => {
    	datatype => 'double',
    	base_name => 'Duration',
    	description => 'The duration of animation effect.',
    	format => '',
    	read_only => '',
    		},
    'repeat_count' => {
    	datatype => 'double',
    	base_name => 'RepeatCount',
    	description => 'The number of times the effect should repeat.',
    	format => '',
    	read_only => '',
    		},
    'repeat_duration' => {
    	datatype => 'double',
    	base_name => 'RepeatDuration',
    	description => 'The number of times the effect should repeat.',
    	format => '',
    	read_only => '',
    		},
    'restart' => {
    	datatype => 'string',
    	base_name => 'Restart',
    	description => 'The way for a effect to restart after complete.',
    	format => '',
    	read_only => '',
    		},
    'speed' => {
    	datatype => 'double',
    	base_name => 'Speed',
    	description => 'The percentage by which to speed up (or slow down) the timing.',
    	format => '',
    	read_only => '',
    		},
    'trigger_delay_time' => {
    	datatype => 'double',
    	base_name => 'TriggerDelayTime',
    	description => 'Delay time after trigger.',
    	format => '',
    	read_only => '',
    		},
    'repeat_until_end_slide' => {
    	datatype => 'boolean',
    	base_name => 'RepeatUntilEndSlide',
    	description => 'Specifies if the effect will repeat until the end of slide.',
    	format => '',
    	read_only => '',
    		},
    'repeat_until_next_click' => {
    	datatype => 'boolean',
    	base_name => 'RepeatUntilNextClick',
    	description => 'Specifies if the effect will repeat until the next click.',
    	format => '',
    	read_only => '',
    		},
    'stop_previous_sound' => {
    	datatype => 'boolean',
    	base_name => 'StopPreviousSound',
    	description => 'This attribute specifies if the animation effect stops the previous sound.',
    	format => '',
    	read_only => '',
    		},
    'rewind' => {
    	datatype => 'boolean',
    	base_name => 'Rewind',
    	description => 'This attribute specifies if the effect will rewind when done playing.',
    	format => '',
    	read_only => '',
    		},
    'after_animation_type' => {
    	datatype => 'string',
    	base_name => 'AfterAnimationType',
    	description => 'Defined an after animation color for effect.',
    	format => '',
    	read_only => '',
    		},
    'after_animation_color' => {
    	datatype => 'string',
    	base_name => 'AfterAnimationColor',
    	description => 'Defined an after animation color for effect. Applied when the AfterAnimationType property is set to Color.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'type' => 'string',
    'subtype' => 'string',
    'preset_class_type' => 'string',
    'animate_text_type' => 'string',
    'shape_index' => 'int',
    'paragraph_index' => 'int',
    'trigger_type' => 'string',
    'accelerate' => 'double',
    'auto_reverse' => 'boolean',
    'decelerate' => 'double',
    'duration' => 'double',
    'repeat_count' => 'double',
    'repeat_duration' => 'double',
    'restart' => 'string',
    'speed' => 'double',
    'trigger_delay_time' => 'double',
    'repeat_until_end_slide' => 'boolean',
    'repeat_until_next_click' => 'boolean',
    'stop_previous_sound' => 'boolean',
    'rewind' => 'boolean',
    'after_animation_type' => 'string',
    'after_animation_color' => 'string'
} );

__PACKAGE__->attribute_map( {
    'type' => 'Type',
    'subtype' => 'Subtype',
    'preset_class_type' => 'PresetClassType',
    'animate_text_type' => 'AnimateTextType',
    'shape_index' => 'ShapeIndex',
    'paragraph_index' => 'ParagraphIndex',
    'trigger_type' => 'TriggerType',
    'accelerate' => 'Accelerate',
    'auto_reverse' => 'AutoReverse',
    'decelerate' => 'Decelerate',
    'duration' => 'Duration',
    'repeat_count' => 'RepeatCount',
    'repeat_duration' => 'RepeatDuration',
    'restart' => 'Restart',
    'speed' => 'Speed',
    'trigger_delay_time' => 'TriggerDelayTime',
    'repeat_until_end_slide' => 'RepeatUntilEndSlide',
    'repeat_until_next_click' => 'RepeatUntilNextClick',
    'stop_previous_sound' => 'StopPreviousSound',
    'rewind' => 'Rewind',
    'after_animation_type' => 'AfterAnimationType',
    'after_animation_color' => 'AfterAnimationColor'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
