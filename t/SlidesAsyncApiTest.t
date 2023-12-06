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

use Test::More;
use Test::Exception;

use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::SlidesAsyncApi;
use AsposeSlidesCloud::TestUtils;

use strict;
use warnings;

my $utils = AsposeSlidesCloud::TestUtils->new();

#
# get_operation_result test
#
subtest 'get_operation_result' => sub {
    my %params = ('id' => $utils->get_param_value('get_operation_result', 'id', 'string'));
    $utils->initialize('get_operation_result', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->get_operation_result(%params);
    };
    if ($@) {
        fail("get_operation_result raised an exception: $@");
    }
    pass();
};

subtest 'get_operation_result invalid id' => sub {
    my %params = ('id' => $utils->get_param_value('get_operation_result', 'id', 'string'));
    $params{ id } = $utils->invalidize_param_value('get_operation_result', 'id', $params{ id }, 'string');
    $utils->initialize('get_operation_result', 'id', $params{ id });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->get_operation_result(%params);
    };
    if ($@) {
        $utils->assert_error('get_operation_result', 'id', $params{ id }, 'string', $@);
    } else {
        $utils->assert_no_error('get_operation_result', 'id', 'string');
    }
};

#
# get_operation_status test
#
subtest 'get_operation_status' => sub {
    my %params = ('id' => $utils->get_param_value('get_operation_status', 'id', 'string'));
    $utils->initialize('get_operation_status', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->get_operation_status(%params);
    };
    if ($@) {
        fail("get_operation_status raised an exception: $@");
    }
    pass();
};

subtest 'get_operation_status invalid id' => sub {
    my %params = ('id' => $utils->get_param_value('get_operation_status', 'id', 'string'));
    $params{ id } = $utils->invalidize_param_value('get_operation_status', 'id', $params{ id }, 'string');
    $utils->initialize('get_operation_status', 'id', $params{ id });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->get_operation_status(%params);
    };
    if ($@) {
        $utils->assert_error('get_operation_status', 'id', $params{ id }, 'string', $@);
    } else {
        $utils->assert_no_error('get_operation_status', 'id', 'string');
    }
};

#
# start_convert test
#
subtest 'start_convert' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $utils->initialize('start_convert', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        fail("start_convert raised an exception: $@");
    }
    pass();
};

subtest 'start_convert invalid document' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ document } = $utils->invalidize_param_value('start_convert', 'document', $params{ document }, 'File');
    $utils->initialize('start_convert', 'document', $params{ document });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'document', $params{ document }, 'File', $@);
    } else {
        $utils->assert_no_error('start_convert', 'document', 'File');
    }
};

subtest 'start_convert invalid format' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ format } = $utils->invalidize_param_value('start_convert', 'format', $params{ format }, 'string');
    $utils->initialize('start_convert', 'format', $params{ format });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'format', $params{ format }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert', 'format', 'string');
    }
};

subtest 'start_convert invalid password' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ password } = $utils->invalidize_param_value('start_convert', 'password', $params{ password }, 'string');
    $utils->initialize('start_convert', 'password', $params{ password });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'password', $params{ password }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert', 'password', 'string');
    }
};

subtest 'start_convert invalid storage' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ storage } = $utils->invalidize_param_value('start_convert', 'storage', $params{ storage }, 'string');
    $utils->initialize('start_convert', 'storage', $params{ storage });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'storage', $params{ storage }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert', 'storage', 'string');
    }
};

subtest 'start_convert invalid fonts_folder' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ fonts_folder } = $utils->invalidize_param_value('start_convert', 'fonts_folder', $params{ fonts_folder }, 'string');
    $utils->initialize('start_convert', 'fonts_folder', $params{ fonts_folder });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'fonts_folder', $params{ fonts_folder }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert', 'fonts_folder', 'string');
    }
};

subtest 'start_convert invalid slides' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ slides } = $utils->invalidize_param_value('start_convert', 'slides', $params{ slides }, 'int[]');
    $utils->initialize('start_convert', 'slides', $params{ slides });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'slides', $params{ slides }, 'int[]', $@);
    } else {
        $utils->assert_no_error('start_convert', 'slides', 'int[]');
    }
};

subtest 'start_convert invalid options' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert', 'document', 'File'), 'format' => $utils->get_param_value('start_convert', 'format', 'string'), 'password' => $utils->get_param_value('start_convert', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert', 'options', 'ExportOptions'));
    $params{ options } = $utils->invalidize_param_value('start_convert', 'options', $params{ options }, 'ExportOptions');
    $utils->initialize('start_convert', 'options', $params{ options });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert', 'options', $params{ options }, 'ExportOptions', $@);
    } else {
        $utils->assert_no_error('start_convert', 'options', 'ExportOptions');
    }
};

#
# start_convert_and_save test
#
subtest 'start_convert_and_save' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $utils->initialize('start_convert_and_save', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        fail("start_convert_and_save raised an exception: $@");
    }
    pass();
};

subtest 'start_convert_and_save invalid document' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ document } = $utils->invalidize_param_value('start_convert_and_save', 'document', $params{ document }, 'File');
    $utils->initialize('start_convert_and_save', 'document', $params{ document });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'document', $params{ document }, 'File', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'document', 'File');
    }
};

subtest 'start_convert_and_save invalid format' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ format } = $utils->invalidize_param_value('start_convert_and_save', 'format', $params{ format }, 'string');
    $utils->initialize('start_convert_and_save', 'format', $params{ format });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'format', $params{ format }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'format', 'string');
    }
};

subtest 'start_convert_and_save invalid out_path' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ out_path } = $utils->invalidize_param_value('start_convert_and_save', 'out_path', $params{ out_path }, 'string');
    $utils->initialize('start_convert_and_save', 'out_path', $params{ out_path });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'out_path', $params{ out_path }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'out_path', 'string');
    }
};

subtest 'start_convert_and_save invalid password' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ password } = $utils->invalidize_param_value('start_convert_and_save', 'password', $params{ password }, 'string');
    $utils->initialize('start_convert_and_save', 'password', $params{ password });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'password', $params{ password }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'password', 'string');
    }
};

subtest 'start_convert_and_save invalid storage' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ storage } = $utils->invalidize_param_value('start_convert_and_save', 'storage', $params{ storage }, 'string');
    $utils->initialize('start_convert_and_save', 'storage', $params{ storage });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'storage', $params{ storage }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'storage', 'string');
    }
};

subtest 'start_convert_and_save invalid fonts_folder' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ fonts_folder } = $utils->invalidize_param_value('start_convert_and_save', 'fonts_folder', $params{ fonts_folder }, 'string');
    $utils->initialize('start_convert_and_save', 'fonts_folder', $params{ fonts_folder });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'fonts_folder', $params{ fonts_folder }, 'string', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'fonts_folder', 'string');
    }
};

subtest 'start_convert_and_save invalid slides' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ slides } = $utils->invalidize_param_value('start_convert_and_save', 'slides', $params{ slides }, 'int[]');
    $utils->initialize('start_convert_and_save', 'slides', $params{ slides });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'slides', $params{ slides }, 'int[]', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'slides', 'int[]');
    }
};

subtest 'start_convert_and_save invalid options' => sub {
    my %params = ('document' => $utils->get_param_value('start_convert_and_save', 'document', 'File'), 'format' => $utils->get_param_value('start_convert_and_save', 'format', 'string'), 'out_path' => $utils->get_param_value('start_convert_and_save', 'out_path', 'string'), 'password' => $utils->get_param_value('start_convert_and_save', 'password', 'string'), 'storage' => $utils->get_param_value('start_convert_and_save', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_convert_and_save', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_convert_and_save', 'slides', 'int[]'), 'options' => $utils->get_param_value('start_convert_and_save', 'options', 'ExportOptions'));
    $params{ options } = $utils->invalidize_param_value('start_convert_and_save', 'options', $params{ options }, 'ExportOptions');
    $utils->initialize('start_convert_and_save', 'options', $params{ options });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_convert_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_convert_and_save', 'options', $params{ options }, 'ExportOptions', $@);
    } else {
        $utils->assert_no_error('start_convert_and_save', 'options', 'ExportOptions');
    }
};

#
# start_download_presentation test
#
subtest 'start_download_presentation' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $utils->initialize('start_download_presentation', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        fail("start_download_presentation raised an exception: $@");
    }
    pass();
};

subtest 'start_download_presentation invalid name' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ name } = $utils->invalidize_param_value('start_download_presentation', 'name', $params{ name }, 'string');
    $utils->initialize('start_download_presentation', 'name', $params{ name });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'name', $params{ name }, 'string', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'name', 'string');
    }
};

subtest 'start_download_presentation invalid format' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ format } = $utils->invalidize_param_value('start_download_presentation', 'format', $params{ format }, 'string');
    $utils->initialize('start_download_presentation', 'format', $params{ format });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'format', $params{ format }, 'string', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'format', 'string');
    }
};

subtest 'start_download_presentation invalid options' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ options } = $utils->invalidize_param_value('start_download_presentation', 'options', $params{ options }, 'ExportOptions');
    $utils->initialize('start_download_presentation', 'options', $params{ options });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'options', $params{ options }, 'ExportOptions', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'options', 'ExportOptions');
    }
};

subtest 'start_download_presentation invalid password' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ password } = $utils->invalidize_param_value('start_download_presentation', 'password', $params{ password }, 'string');
    $utils->initialize('start_download_presentation', 'password', $params{ password });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'password', $params{ password }, 'string', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'password', 'string');
    }
};

subtest 'start_download_presentation invalid folder' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ folder } = $utils->invalidize_param_value('start_download_presentation', 'folder', $params{ folder }, 'string');
    $utils->initialize('start_download_presentation', 'folder', $params{ folder });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'folder', $params{ folder }, 'string', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'folder', 'string');
    }
};

subtest 'start_download_presentation invalid storage' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ storage } = $utils->invalidize_param_value('start_download_presentation', 'storage', $params{ storage }, 'string');
    $utils->initialize('start_download_presentation', 'storage', $params{ storage });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'storage', $params{ storage }, 'string', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'storage', 'string');
    }
};

subtest 'start_download_presentation invalid fonts_folder' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ fonts_folder } = $utils->invalidize_param_value('start_download_presentation', 'fonts_folder', $params{ fonts_folder }, 'string');
    $utils->initialize('start_download_presentation', 'fonts_folder', $params{ fonts_folder });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'fonts_folder', $params{ fonts_folder }, 'string', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'fonts_folder', 'string');
    }
};

subtest 'start_download_presentation invalid slides' => sub {
    my %params = ('name' => $utils->get_param_value('start_download_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_download_presentation', 'format', 'string'), 'options' => $utils->get_param_value('start_download_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_download_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_download_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_download_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_download_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_download_presentation', 'slides', 'int[]'));
    $params{ slides } = $utils->invalidize_param_value('start_download_presentation', 'slides', $params{ slides }, 'int[]');
    $utils->initialize('start_download_presentation', 'slides', $params{ slides });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_download_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_download_presentation', 'slides', $params{ slides }, 'int[]', $@);
    } else {
        $utils->assert_no_error('start_download_presentation', 'slides', 'int[]');
    }
};

#
# start_merge test
#
subtest 'start_merge' => sub {
    my %params = ('files' => $utils->get_param_value('start_merge', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge', 'storage', 'string'));
    $utils->initialize('start_merge', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge(%params);
    };
    if ($@) {
        fail("start_merge raised an exception: $@");
    }
    pass();
};

subtest 'start_merge invalid files' => sub {
    my %params = ('files' => $utils->get_param_value('start_merge', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge', 'storage', 'string'));
    $params{ files } = $utils->invalidize_param_value('start_merge', 'files', $params{ files }, 'ARRAY[string]');
    $utils->initialize('start_merge', 'files', $params{ files });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge', 'files', $params{ files }, 'ARRAY[string]', $@);
    } else {
        $utils->assert_no_error('start_merge', 'files', 'ARRAY[string]');
    }
};

subtest 'start_merge invalid request' => sub {
    my %params = ('files' => $utils->get_param_value('start_merge', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge', 'storage', 'string'));
    $params{ request } = $utils->invalidize_param_value('start_merge', 'request', $params{ request }, 'OrderedMergeRequest');
    $utils->initialize('start_merge', 'request', $params{ request });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge', 'request', $params{ request }, 'OrderedMergeRequest', $@);
    } else {
        $utils->assert_no_error('start_merge', 'request', 'OrderedMergeRequest');
    }
};

subtest 'start_merge invalid storage' => sub {
    my %params = ('files' => $utils->get_param_value('start_merge', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge', 'storage', 'string'));
    $params{ storage } = $utils->invalidize_param_value('start_merge', 'storage', $params{ storage }, 'string');
    $utils->initialize('start_merge', 'storage', $params{ storage });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge', 'storage', $params{ storage }, 'string', $@);
    } else {
        $utils->assert_no_error('start_merge', 'storage', 'string');
    }
};

#
# start_merge_and_save test
#
subtest 'start_merge_and_save' => sub {
    my %params = ('out_path' => $utils->get_param_value('start_merge_and_save', 'out_path', 'string'), 'files' => $utils->get_param_value('start_merge_and_save', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge_and_save', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge_and_save', 'storage', 'string'));
    $utils->initialize('start_merge_and_save', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge_and_save(%params);
    };
    if ($@) {
        fail("start_merge_and_save raised an exception: $@");
    }
    pass();
};

subtest 'start_merge_and_save invalid out_path' => sub {
    my %params = ('out_path' => $utils->get_param_value('start_merge_and_save', 'out_path', 'string'), 'files' => $utils->get_param_value('start_merge_and_save', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge_and_save', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge_and_save', 'storage', 'string'));
    $params{ out_path } = $utils->invalidize_param_value('start_merge_and_save', 'out_path', $params{ out_path }, 'string');
    $utils->initialize('start_merge_and_save', 'out_path', $params{ out_path });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge_and_save', 'out_path', $params{ out_path }, 'string', $@);
    } else {
        $utils->assert_no_error('start_merge_and_save', 'out_path', 'string');
    }
};

subtest 'start_merge_and_save invalid files' => sub {
    my %params = ('out_path' => $utils->get_param_value('start_merge_and_save', 'out_path', 'string'), 'files' => $utils->get_param_value('start_merge_and_save', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge_and_save', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge_and_save', 'storage', 'string'));
    $params{ files } = $utils->invalidize_param_value('start_merge_and_save', 'files', $params{ files }, 'ARRAY[string]');
    $utils->initialize('start_merge_and_save', 'files', $params{ files });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge_and_save', 'files', $params{ files }, 'ARRAY[string]', $@);
    } else {
        $utils->assert_no_error('start_merge_and_save', 'files', 'ARRAY[string]');
    }
};

subtest 'start_merge_and_save invalid request' => sub {
    my %params = ('out_path' => $utils->get_param_value('start_merge_and_save', 'out_path', 'string'), 'files' => $utils->get_param_value('start_merge_and_save', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge_and_save', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge_and_save', 'storage', 'string'));
    $params{ request } = $utils->invalidize_param_value('start_merge_and_save', 'request', $params{ request }, 'OrderedMergeRequest');
    $utils->initialize('start_merge_and_save', 'request', $params{ request });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge_and_save', 'request', $params{ request }, 'OrderedMergeRequest', $@);
    } else {
        $utils->assert_no_error('start_merge_and_save', 'request', 'OrderedMergeRequest');
    }
};

subtest 'start_merge_and_save invalid storage' => sub {
    my %params = ('out_path' => $utils->get_param_value('start_merge_and_save', 'out_path', 'string'), 'files' => $utils->get_param_value('start_merge_and_save', 'files', 'ARRAY[string]'), 'request' => $utils->get_param_value('start_merge_and_save', 'request', 'OrderedMergeRequest'), 'storage' => $utils->get_param_value('start_merge_and_save', 'storage', 'string'));
    $params{ storage } = $utils->invalidize_param_value('start_merge_and_save', 'storage', $params{ storage }, 'string');
    $utils->initialize('start_merge_and_save', 'storage', $params{ storage });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_merge_and_save(%params);
    };
    if ($@) {
        $utils->assert_error('start_merge_and_save', 'storage', $params{ storage }, 'string', $@);
    } else {
        $utils->assert_no_error('start_merge_and_save', 'storage', 'string');
    }
};

#
# start_save_presentation test
#
subtest 'start_save_presentation' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $utils->initialize('start_save_presentation', '');
    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        fail("start_save_presentation raised an exception: $@");
    }
    pass();
};

subtest 'start_save_presentation invalid name' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ name } = $utils->invalidize_param_value('start_save_presentation', 'name', $params{ name }, 'string');
    $utils->initialize('start_save_presentation', 'name', $params{ name });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'name', $params{ name }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'name', 'string');
    }
};

subtest 'start_save_presentation invalid format' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ format } = $utils->invalidize_param_value('start_save_presentation', 'format', $params{ format }, 'string');
    $utils->initialize('start_save_presentation', 'format', $params{ format });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'format', $params{ format }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'format', 'string');
    }
};

subtest 'start_save_presentation invalid out_path' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ out_path } = $utils->invalidize_param_value('start_save_presentation', 'out_path', $params{ out_path }, 'string');
    $utils->initialize('start_save_presentation', 'out_path', $params{ out_path });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'out_path', $params{ out_path }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'out_path', 'string');
    }
};

subtest 'start_save_presentation invalid options' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ options } = $utils->invalidize_param_value('start_save_presentation', 'options', $params{ options }, 'ExportOptions');
    $utils->initialize('start_save_presentation', 'options', $params{ options });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'options', $params{ options }, 'ExportOptions', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'options', 'ExportOptions');
    }
};

subtest 'start_save_presentation invalid password' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ password } = $utils->invalidize_param_value('start_save_presentation', 'password', $params{ password }, 'string');
    $utils->initialize('start_save_presentation', 'password', $params{ password });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'password', $params{ password }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'password', 'string');
    }
};

subtest 'start_save_presentation invalid folder' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ folder } = $utils->invalidize_param_value('start_save_presentation', 'folder', $params{ folder }, 'string');
    $utils->initialize('start_save_presentation', 'folder', $params{ folder });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'folder', $params{ folder }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'folder', 'string');
    }
};

subtest 'start_save_presentation invalid storage' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ storage } = $utils->invalidize_param_value('start_save_presentation', 'storage', $params{ storage }, 'string');
    $utils->initialize('start_save_presentation', 'storage', $params{ storage });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'storage', $params{ storage }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'storage', 'string');
    }
};

subtest 'start_save_presentation invalid fonts_folder' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ fonts_folder } = $utils->invalidize_param_value('start_save_presentation', 'fonts_folder', $params{ fonts_folder }, 'string');
    $utils->initialize('start_save_presentation', 'fonts_folder', $params{ fonts_folder });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'fonts_folder', $params{ fonts_folder }, 'string', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'fonts_folder', 'string');
    }
};

subtest 'start_save_presentation invalid slides' => sub {
    my %params = ('name' => $utils->get_param_value('start_save_presentation', 'name', 'string'), 'format' => $utils->get_param_value('start_save_presentation', 'format', 'string'), 'out_path' => $utils->get_param_value('start_save_presentation', 'out_path', 'string'), 'options' => $utils->get_param_value('start_save_presentation', 'options', 'ExportOptions'), 'password' => $utils->get_param_value('start_save_presentation', 'password', 'string'), 'folder' => $utils->get_param_value('start_save_presentation', 'folder', 'string'), 'storage' => $utils->get_param_value('start_save_presentation', 'storage', 'string'), 'fonts_folder' => $utils->get_param_value('start_save_presentation', 'fonts_folder', 'string'), 'slides' => $utils->get_param_value('start_save_presentation', 'slides', 'int[]'));
    $params{ slides } = $utils->invalidize_param_value('start_save_presentation', 'slides', $params{ slides }, 'int[]');
    $utils->initialize('start_save_presentation', 'slides', $params{ slides });

    eval {
        my $result = $utils->{testSlidesAsyncApi}->start_save_presentation(%params);
    };
    if ($@) {
        $utils->assert_error('start_save_presentation', 'slides', $params{ slides }, 'int[]', $@);
    } else {
        $utils->assert_no_error('start_save_presentation', 'slides', 'int[]');
    }
};


done_testing;