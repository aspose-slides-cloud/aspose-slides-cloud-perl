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

package AsposeSlidesCloud::Object::AccessPermissions;

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
#A set of properties specifying which access permissions should be granted when the document is opened with user access.
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

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

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
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

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    my $current_types = {};
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
        $current_types->{$_key} = $_type;
    }
    while ( my ($_key, $_type) = each %{$current_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                if (defined $_element) {
                    push @_array, $self->_deserialize($_subclass, $_element);
                } else {
                    push @_array, undef;
                }
            }
            foreach my $_element (@{$hash->{lcfirst($_json_attribute)}}) {
                if (defined $_element) {
                    push @_array, $self->_deserialize(lcfirst($_subclass), $_element);
                } else {
                    push @_array, undef;
                }
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } elsif (exists $hash->{lcfirst($_json_attribute)}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{lcfirst($_json_attribute)});
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $class = AsposeSlidesCloud::ClassRegistry->get_class_name(ucfirst($type), $data);
        my $_instance = use_module("AsposeSlidesCloud::Object::$class")->new();
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => 'A set of properties specifying which access permissions should be granted when the document is opened with user access.',
                                  class => 'AccessPermissions',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'print_document' => {
    	datatype => 'boolean',
    	base_name => 'PrintDocument',
    	description => 'The user may print the document (possibly not at the highest quality level, depending on whether bit HighQualityPrint is also set).',
    	format => '',
    	read_only => '',
    		},
    'modify_content' => {
    	datatype => 'boolean',
    	base_name => 'ModifyContent',
    	description => 'The user may modify the contents of the document by operations other than those controlled by bits AddOrModifyFields, FillExistingFields, AssembleDocument.',
    	format => '',
    	read_only => '',
    		},
    'copy_text_and_graphics' => {
    	datatype => 'boolean',
    	base_name => 'CopyTextAndGraphics',
    	description => 'The user may copy or otherwise extract text and graphics from the document by operations other than that controlled by bit ExtractTextAndGraphics.',
    	format => '',
    	read_only => '',
    		},
    'add_or_modify_fields' => {
    	datatype => 'boolean',
    	base_name => 'AddOrModifyFields',
    	description => 'The user may add or modify text annotations, fill in interactive form fields, and, if bit ModifyContent is also set, create or modify interactive form fields (including signature fields).',
    	format => '',
    	read_only => '',
    		},
    'fill_existing_fields' => {
    	datatype => 'boolean',
    	base_name => 'FillExistingFields',
    	description => 'The user may fill in existing interactive form fields (including signature fields), even if bit AddOrModifyFields is clear.',
    	format => '',
    	read_only => '',
    		},
    'extract_text_and_graphics' => {
    	datatype => 'boolean',
    	base_name => 'ExtractTextAndGraphics',
    	description => 'The user may extract text and graphics in support of accessibility to users with disabilities or for other purposes.',
    	format => '',
    	read_only => '',
    		},
    'assemble_document' => {
    	datatype => 'boolean',
    	base_name => 'AssembleDocument',
    	description => 'The user may assemble the document (insert, rotate, or delete pages and create bookmarks or thumbnail images), even if bit ModifyContent is clear.',
    	format => '',
    	read_only => '',
    		},
    'high_quality_print' => {
    	datatype => 'boolean',
    	base_name => 'HighQualityPrint',
    	description => 'The user may print the document to a representation from which a faithful digital copy of the PDF content could be generated. When this bit is clear (and bit PrintDocument is set), printing is limited to a low-level representation of the appearance, possibly of degraded quality.',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'print_document' => 'boolean',
    'modify_content' => 'boolean',
    'copy_text_and_graphics' => 'boolean',
    'add_or_modify_fields' => 'boolean',
    'fill_existing_fields' => 'boolean',
    'extract_text_and_graphics' => 'boolean',
    'assemble_document' => 'boolean',
    'high_quality_print' => 'boolean'
} );

__PACKAGE__->attribute_map( {
    'print_document' => 'PrintDocument',
    'modify_content' => 'ModifyContent',
    'copy_text_and_graphics' => 'CopyTextAndGraphics',
    'add_or_modify_fields' => 'AddOrModifyFields',
    'fill_existing_fields' => 'FillExistingFields',
    'extract_text_and_graphics' => 'ExtractTextAndGraphics',
    'assemble_document' => 'AssembleDocument',
    'high_quality_print' => 'HighQualityPrint'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
