# Minitest::Pngdiff

Provides assertions that allow direct PNG comparison via ChunkyPNG.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minitest-pngdiff'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-pngdiff

## Usage

`assert_png_diff(png1, png2, threshold, diff_method: :distance, msg: nil)`

Provide this assertion with two PNGs (can be file paths, PNG blobs, or IO objects) and a difference threshold for success/failure. Optionally, provide a method of pixel difference calculation (only :distance right now) or a custom message.

Use `refute_png_diff` for refuting two PNG diffs.

`assert_png_equal(png1, png2, threshold, msg: nil`

Used like `assert_png_diff` but assumes that you want a difference threshold of 0.0. See `refute_png_equal` to refute two PNGs having a difference threshold of 0.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/customink/minitest-pngdiff. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
