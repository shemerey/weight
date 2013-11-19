# Weight

It's dead simple Value object, which provides convenient way to work with
weight in a different unit systems. It could be useful if you have to work with
different unit system, for example you have to work with :kg as well as :lb for USA

## Installation

Add this line to your application's Gemfile:

    gem 'weight'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weight

## Usage

### Basic Math with Weight objects

 Weight.new(1, :kg) + Weight.new(1, :kg) == Weight.new(2, :kg)
 Weight.new(1, :kg) - Weight.new(1, :kg) == Weight.new(0, :kg)

 Weight.new(1, :kg) * 2 == Weight.new(2, :kg)
 Weight.new(2, :kg) / 2 == Weight.new(1, :kg)

### Basic comparison with Weight objects

 Weight.new(3, :lb).between?(Weight.new(1, :kg), Weight.new(2, :kg))
 Weight.new(1, :kg) > Weight.new(2, :lb)
 Weight.new(1, :lb) <= Weight.new(0.5, :kg)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
