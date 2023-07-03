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

use AsposeSlidesCloud::SlidesApi;

use strict;
use warnings;

subtest 'good auth' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

subtest 'bad auth' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = 'invalid';
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    eval {
        $api->get_api_info();
    };
    if ($@) {
        if ($@ =~ m/API Exception\((\d+)\): (.*) /s) {
            is($1, 401);
        } else {
            fail("Strange exception for bad auth");
        }
    } else {
        fail('Must have failed');
    }
    pass();
};

subtest 'good token' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();

    $config->{app_sid} = 'invalid';
    $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

subtest 'bad token' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();

    $config->{access_token} = 'invalid';
    $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

subtest 'expired token' => sub {
    my $config = AsposeSlidesCloud::Configuration->new();
    my $config_file = decode_json(read_file("testConfig.json"));
    $config->{base_url} = $config_file->{BaseUrl};
    $config->{auth_base_url} = $config_file->{AuthBaseUrl};
    $config->{app_sid} = $config_file->{ClientId};
    $config->{app_key} = $config_file->{ClientSecret};
    $config->{debug} = $config_file->{Debug};
    my $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();

    $config->{access_token} = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2ODYzMzI5ODAsImV4cCI6MTY4NjQxOTM4MCwiaXNzIjoiaHR0cHM6Ly9hcGkuYXNwb3NlLmNsb3VkIiwiYXVkIjpbImh0dHBzOi8vYXBpLmFzcG9zZS5jbG91ZC9yZXNvdXJjZXMiLCJhcGkuYmlsbGluZyIsImFwaS5pZGVudGl0eSIsImFwaS5wcm9kdWN0cyIsImFwaS5zdG9yYWdlIl0sImNsaWVudF9pZCI6ImVhMTFkNzAwLWE3YjAtNDgwMi05YjFjLWRmYWVhNGI2OTA0YSIsImNsaWVudF9kZWZhdWx0X3N0b3JhZ2UiOiIyNDc5NjRmYy04MjIyLTQ4M2EtYmZmMS1kNTYxYzM5MjQ3ZWIiLCJjbGllbnRfaWRlbnRpdHlfdXNlcl9pZCI6Ijc2MjY4MiIsInNjb3BlIjpbImFwaS5iaWxsaW5nIiwiYXBpLmlkZW50aXR5IiwiYXBpLnByb2R1Y3RzIiwiYXBpLnN0b3JhZ2UiXX0.qGRwbpVQNJ7k09FF81bfknBd_9bERkProMukobxkAEzwIhIRSwCDvzgVhhUcA-OMr8s-49XLYtFb6ZtuDT2r3xDsYXWxwjYekFk4MZhEFKeIqLyI9-kSxanL7w4WoKkE_OAXHquChRJcsqz5vhKOOJ9swu4PS0TSRYHfkLFsLpZLXIV4X53Ear8vDosOfeZONq9QPCfikCi1ruSMa3OddD2WE17_V3FzzyuC7d3FQxRznFJhyWoKI2jvOw7a92KatWVt3I78fOl9M-3MkkHR1ip5CXp3arnn139i73D-TfXeRNcAU5UpAGfuYPbIDpTkJ-DirqYWO6I5S7JmchPl1A';
    $api = AsposeSlidesCloud::SlidesApi->new(config => $config);
    $api->get_api_info();
    pass();
};

done_testing;
