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
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::Object::VbaModule;
use AsposeSlidesCloud::Object::VbaReference;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

subtest 'create VBA module' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/test.pptx", 'dest_path' => "TempSlidesSDK/test.pptx");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::VbaModule->new();
        $dto->{name} = "Module1";
        $dto->{source_code} = "Sub Test() MsgBox \"Test\" End Sub";
        my $reference_0 = AsposeSlidesCloud::Object::VbaReference->new();
        $reference_0->{name} = "stdole";
        $reference_0->{lib_id} = "*\\G{00020430-0000-0000-C000-000000000046}#2.0#0#C:\\Windows\\system32\\stdole2.tlb#OLE Automation";
        my $reference_1 = AsposeSlidesCloud::Object::VbaReference->new();
        $reference_1->{name} = "Office";
        $reference_1->{lib_id} = "*\\G{2DF8D04C-5BFA-101B-BDE5-00AA0044DE52}#2.0#0#C:\\Program Files\\Common Files\\Microsoft Shared\\OFFICE14\\MSO.DLL#Microsoft Office 14.0 Object Library";
        my @references = ($reference_0, $reference_1);
        $dto->{references} = \@references;

        my %params = ('name' => 'test.pptx', 'module_dto' => $dto, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{testSlidesApi}->create_vba_module(%params);
        print STDERR "'".$response->{name}."' has been created\n".$response->{self_uri}->{href};
    };
    if ($@) {
        fail("create_vba_module raised an exception: $@");
    }
    pass();
};

subtest 'delete VBA module' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/macros.pptm", 'dest_path' => "TempSlidesSDK/macros.pptm");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => 'macros.pptm', 'module_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{testSlidesApi}->delete_vba_module(%params);
        my $modules_count = scalar @{$response->{modules}};
        my $references_count = scalar @{$response->{references}};
        print STDERR "VBA project contains: ".$modules_count." module(s), and ".$references_count." references";
    };
    if ($@) {
        fail("delete_vba_module raised an exception: $@");
    }
    pass();
};

subtest 'get VBA module' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/macros.pptm", 'dest_path' => "TempSlidesSDK/macros.pptm");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => 'macros.pptm', 'module_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{testSlidesApi}->get_vba_module(%params);
        print STDERR "Module: ".$response->{name}."\n".$response->{source_code};
    };
    if ($@) {
        fail("get_vba_module raised an exception: $@");
    }
    pass();
};

subtest 'get VBA project' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/macros.pptm", 'dest_path' => "TempSlidesSDK/macros.pptm");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my %params = ('name' => 'macros.pptm', 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{testSlidesApi}->get_vba_project(%params);
        my $modules_count = scalar @{$response->{modules}};
        my $references_count = scalar @{$response->{references}};
        print STDERR "VBA project contains: ".$modules_count." module(s), and ".$references_count." references";
    };
    if ($@) {
        fail("get_vba_project raised an exception: $@");
    }
    pass();
};

subtest 'update VBA module' => sub {
    eval {
        my %copy_params = ('src_path' => "TempTests/macros.pptm", 'dest_path' => "TempSlidesSDK/macros.pptm");
        $utils->{testSlidesApi}->copy_file(%copy_params);

        my $dto = AsposeSlidesCloud::Object::VbaModule->new();
        $dto->{source_code} = "Sub Test() MsgBox \"Test\" End Sub";

        my %params = ('name' => 'macros.pptm', 'module_dto' => $dto, 'module_index' => 1, 'password' => 'password', 'folder' => 'TempSlidesSDK');
        my $response = $utils->{testSlidesApi}->update_vba_module(%params);
        print STDERR "'".$response->{name}."' has been updated\n".$response->{self_uri}->{href};
    };
    if ($@) {
        fail("update_vba_module raised an exception: $@");
    }
    pass();
};

done_testing;