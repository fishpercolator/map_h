# map_h

Adds a `map_h` method to Enumerable for easily building hashes from a 
given block.

[![Gem Version](https://img.shields.io/gem/v/map_h.svg?style=flat)](https://rubygems.org/gems/map_h)
[![Build Status](https://img.shields.io/travis/fishpercolator/map_h/master.svg?style=flat)](https://travis-ci.org/fishpercolator/map_h)

This is similar to the existing `map` method, but retains the original values
as the keys in the resulting hash.

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'map_h'
```

And then execute:

```sh
$ bundle
```

## Usage

The method will be added to all Enumerable objects when you:

```ruby
require 'map_h'
```

To use `map_h`, pass it a block. For example:

```ruby
['john', 'paul', 'george', 'ringo'].map_h { |name| name.length }
# => {'john' => 4, 'paul' => 4, 'george' => 6, 'ringo' => 5}
```

Or you can use the shorthand `Symbol#to_proc` syntax:

```ruby
['john', 'paul', 'george', 'ringo'].map_h(&:length)
# => {'john' => 4, 'paul' => 4, 'george' => 6, 'ringo' => 5}
```

If the Enumerable yields multiple values (e.g. Hash), an array of these
values will be used as the key:

```ruby
{
  'george' => 'guitar',
  'ringo'  => 'drums'
}.map_h {|name, instrument| "#{instrument}: #{name}"}
# => {
#      ['george', 'guitar'] => "guitar: george",
#      ['ringo', 'drums']   => "drums: ringo"
#    }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/map_h. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Future

* Have `map_h` return an Enumerator instead of raising an exception if no
  block is passed.
