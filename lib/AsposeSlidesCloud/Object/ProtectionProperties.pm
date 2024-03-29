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

package AsposeSlidesCloud::Object::ProtectionProperties;

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

use AsposeSlidesCloud::Object::ResourceBase;
use AsposeSlidesCloud::Object::ResourceUri;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#Protection properties.
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


__PACKAGE__->class_documentation({description => 'Protection properties.',
                                  class => 'ProtectionProperties',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'self_uri' => {
    	datatype => 'ResourceUri',
    	base_name => 'SelfUri',
    	description => 'Gets or sets the link to this resource.',
    	format => '',
    	read_only => '',
    		},
    'alternate_links' => {
    	datatype => 'ARRAY[ResourceUri]',
    	base_name => 'AlternateLinks',
    	description => 'List of alternate links.',
    	format => '',
    	read_only => '',
    		},
    'encrypt_document_properties' => {
    	datatype => 'boolean',
    	base_name => 'EncryptDocumentProperties',
    	description => 'True if document properties are encrypted. Has effect only for password protected presentations.',
    	format => '',
    	read_only => '',
    		},
    'read_only_recommended' => {
    	datatype => 'boolean',
    	base_name => 'ReadOnlyRecommended',
    	description => 'True if the document should be opened as read-only.',
    	format => '',
    	read_only => '',
    		},
    'read_password' => {
    	datatype => 'string',
    	base_name => 'ReadPassword',
    	description => 'Password for read protection.',
    	format => '',
    	read_only => '',
    		},
    'write_password' => {
    	datatype => 'string',
    	base_name => 'WritePassword',
    	description => 'Password for write protection.',
    	format => '',
    	read_only => '',
    		},
    'is_write_protected' => {
    	datatype => 'boolean',
    	base_name => 'IsWriteProtected',
    	description => 'Returns true if the presentation protected for editing. ',
    	format => '',
    	read_only => '',
    		},
    'is_encrypted' => {
    	datatype => 'boolean',
    	base_name => 'IsEncrypted',
    	description => 'Returns true if the presentation protected for reading. ',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'self_uri' => 'ResourceUri',
    'alternate_links' => 'ARRAY[ResourceUri]',
    'encrypt_document_properties' => 'boolean',
    'read_only_recommended' => 'boolean',
    'read_password' => 'string',
    'write_password' => 'string',
    'is_write_protected' => 'boolean',
    'is_encrypted' => 'boolean'
} );

__PACKAGE__->attribute_map( {
    'self_uri' => 'SelfUri',
    'alternate_links' => 'AlternateLinks',
    'encrypt_document_properties' => 'EncryptDocumentProperties',
    'read_only_recommended' => 'ReadOnlyRecommended',
    'read_password' => 'ReadPassword',
    'write_password' => 'WritePassword',
    'is_write_protected' => 'IsWriteProtected',
    'is_encrypted' => 'IsEncrypted'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
