# Rack::Pidiful

Log PID and Request ID on each request to give visiblity into the history
of a particular process (Eg: Unicorn worker).

Request ID is resolved in this order:

    HTTP_HEROKU_REQUEST_ID -> env['HTTP_X_REQUEST_ID'] -> Randomly Generated

Logging is directed to standard out on info level. Example:

    app/web.3: I, [2013-06-12T06:04:21.382512 #35]  INFO -- : worker=5 ready
    app/web.3: source=rack-pidiful request_id=268725430ada5ad9bac162e7baed104d process_id=35
    app/web.3: Started GET "/" for 203.101.294.78 at 2013-06-12 06:05:28 +0000
    heroku/router: at=info method=GET path=/ host=www.myapp.com request_id=268725430ada5ad9bac162e7baed104d fwd="203.101.294.78" dyno=web.3 connect=2ms service=108ms status=201 bytes=97

Inspiration taken from [Rack::Timeout](https://github.com/kch/rack-timeout).

## Installation

    gem 'rack-pidiful', github: 'thebestday/rack-pidiful

## Copyright

See LICENSE for details.
