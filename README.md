# Weight (0.0.2 alpha version)

* [![Code Climate](https://codeclimate.com/github/shemerey/weight.png)](https://codeclimate.com/github/shemerey/weight)
* [![Build Status](https://api.travis-ci.org/shemerey/weight.png)](https://travis-ci.org/shemerey/weight)
* [![Gem Version](https://badge.fury.io/rb/weight.png)](http://badge.fury.io/rb/weight)

It's dead simple Value object, which provides convenient way to work with
weight in a different unit systems. It could be useful if you have to work with
different unit system, for example you have to work with :kg as well as :lb for USA

## Compatible with:

 * mri 2.0.0
 * mri 1.9.3
 * mri 1.9.2
 * jruby-19mode
 * rbx-19mode
 * jruby-18mode
 * mri 1.8.7
 * ree

## Installation

Add this line to your application's Gemfile:

    gem 'weight'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weight

## Configuration
You could configure default unit system (:kg or :lb)

just put this in your initializer: config/initializers/weight.rb

```ruby
  # new object in kg by default
  Weight.new # => <Weight: @input_value=0, @input_unit=:kg>

  Weight::Configuration.configure do |config|
    config.default_unit = :lb  # by default it uses :kg
  end

  # Now default object looks like
  Weight.new # => <Weight: @input_value=0, @input_unit=:lb>
```

## Usage

### Basic Math with Weight objects

```ruby
 Weight.new(1, :kg) + Weight.new(1, :kg) == Weight.new(2, :kg)
 Weight.new(1, :kg) - Weight.new(1, :kg) == Weight.new(0, :kg)

 Weight.new(1, :kg) * 2 == Weight.new(2, :kg)
 Weight.new(2, :kg) / 2 == Weight.new(1, :kg)
```

### Basic comparison with Weight objects

```ruby
 Weight.new(3, :lb).between?(Weight.new(1, :kg), Weight.new(2, :kg))
 Weight.new(1, :kg) > Weight.new(2, :lb)
 Weight.new(1, :lb) <= Weight.new(0.5, :kg)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
