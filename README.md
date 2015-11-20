# LevenshteinRb
    
Plain Ruby implementation of Levenshtein distance algorithm
that measures the similarity of two strings. 

# Disclaimer

This implementation is intended for educational reasons. Use it in production 
with caution. To compare really large strings you may want to use a Ruby 
gem that relies on native C code or similar like

* [levenshtein-ffi](https://github.com/dbalatero/levenshtein-ffi)
* [damerau-levenshtein](https://github.com/GlobalNamesArchitecture/damerau-levenshtein)

It is highly inspired by [this example implementation](http://rosettacode.org/wiki/Levenshtein_distance#Ruby).

## Installation

Add this line to your application's Gemfile:

    gem 'levenshtein_rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install levenshtein_rb

## Usage

    LevenshteinRb::LevenshteinDistance.new('Tor', 'Tier').to_i # => 2

