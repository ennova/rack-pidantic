# Rack::Pidiful

Log PID and Request ID on each request to give visiblity into the history
of a particular process (Eg: Unicorn worker).

Request ID is resolved in this order:

    HTTP_HEROKU_REQUEST_ID -> env['HTTP_X_REQUEST_ID'] -> Randomly Generated

Logs to standard out on info level.

Inspiration taken from [Rack::Timeout](https://github.com/kch/rack-timeout).

## Installation

    gem 'rack-pidiful', github: 'thebestday/rack-pidiful

## Copyright

See LICENSE for details.
