# Rack::Pidantic

[![Build Status](https://travis-ci.org/thebestday/rack-pidantic.png?branch=master)](https://travis-ci.org/thebestday/rack-pidantic)

Log the PID and Request ID on each request to give visibility into the history
of a particular process (Eg: Unicorn worker).

The Request ID is resolved by looking at the headers in this order,
giving preference to Heroku.

    HTTP_HEROKU_REQUEST_ID -> HTTP_X_REQUEST_ID -> Randomly Generated

Logging is directed to standard out on info level. Example:

    app/web.3: I, [2013-06-12T06:04:21.382512 #35]  INFO -- : worker=5 ready
    app/web.3: source=rack-pidantic request_id=268725430ada5ad9bac162e7baed104d process_id=35
    app/web.3: Started GET "/" for 203.101.294.78 at 2013-06-12 06:05:28 +0000
    heroku/router: at=info method=GET path=/ host=www.myapp.com request_id=268725430ada5ad9bac162e7baed104d fwd="203.101.294.78" dyno=web.3 connect=2ms service=108ms status=201 bytes=97

Inspiration taken from [Rack::Timeout](https://github.com/kch/rack-timeout).

## Dependencies

* Ruby 1.9, 2.0
* Rack

## Installation

Add this to your gemfile.

    gem 'rack-pidantic', github: 'thebestday/rack-pidantic

Run bundler.

    $ bundle install

If you're using Rails then Rack::Pidantic will automatically be inserted
into your middleware stack. If you're using Sinatra then take a look at
how to use [Rack Middleware](http://www.sinatrarb.com/intro.html#Rack%20Middleware).

## Tests

Run the entire test suite.

    $ rake

## Copyright

See LICENSE for details.
