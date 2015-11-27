# Easy Matchers

[![Gem Version](https://badge.fury.io/rb/easy-matchers.svg)](https://badge.fury.io/rb/easy-matchers)
[![Code Climate](https://codeclimate.com/github/MLSDev/easy-matchers/badges/gpa.svg)](https://codeclimate.com/github/MLSDev/easy-matchers)
[![Test Coverage](https://codeclimate.com/github/MLSDev/easy-matchers/badges/coverage.svg)](https://codeclimate.com/github/MLSDev/easy-matchers/coverage)
[![Build Status](https://travis-ci.org/MLSDev/easy-matchers.svg)](https://travis-ci.org/MLSDev/easy-matchers)

Easy matchers provides RSpec matchers for common Rails functionality.

----

## Why

1. We want write specs all functionality in our Rails application. Yes, with validations, associations and all other things.

2. We want check presence of validations and associations, but don't test implementations. This is main difference with shoulda-matchers. Shoulda-matchers instead checking the presence of validations or associations, check implementation. Why are we should test rails?

## ActiveModel::Validations matchers

* validate_absence_of
* validate_acceptance_of
* validate_confirmation_of
* validate_length_of
* validate_numericality_of
* validate_presence_of

## Install and configure

`gem install easy-matchers`

or via bundler:

`gem 'easy-matchers'`

spec/support/easy-matchers.rb:
```
RSpec.configure do |config|
  config.include Easy::Matchers::Validations, type: :model
end
```

## Examples

```ruby

```

## License

This work is licensed under a MIT License.

## About MLSDev

[<img src="/mlsdev-logo.png" alt="MLSDev.com">][mlsdev]

Easy-Matcher are maintained by MLSDev, Inc. We specialize in providing all-in-one solution in mobile and web development. Our team follows Lean principles and works according to agile methodologies to deliver the best results reducing the budget for development and its timeline. 

Find out more [here][mlsdev] and don't hesitate to [contact us][contact]!

[mlsdev]: http://mlsdev.com
[contact]: http://mlsdev.com/contact_us


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/MLSDev/easy-matchers/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

