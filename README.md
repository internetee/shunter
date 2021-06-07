# Shunter

This gem intended to do simple request throttling on application/controller level.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shunter', github: 'internetee/shunter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shunter

## Usage

For enabling throttling in controller you need to define a method to get object to store throttling data:

```ruby
def throttled_user
  current_user
end
```

and to define a constant describing controller actons to throttle
```ruby
THROTTLED_ACTIONS = %i[info renew update transfer delete].freeze
```

After that you could include gem in your controller.
```ruby
include Shunter::Integration::Throttle
```

Shunter uses Redis to store requests data and answers with HTTP 429 if connection limit per time exceeded.
Also gem got some customisable environment variables as well as default values.

    ENV["shunter_redis_connection"] # Default value is { host: "redis", port: 6379 }
    ENV["shunter_default_timespan"] # Default value is 60 (seconds), used to expire Redis keys
    ENV["shunter_default_threshold"] # Default value is 100


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/internetee/shunter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
