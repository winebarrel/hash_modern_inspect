# hash_modern_inspect

Inspect Hash object as modern format.

[![Build Status](https://travis-ci.org/winebarrel/hash_modern_inspect.svg?branch=master)](https://travis-ci.org/winebarrel/hash_modern_inspect)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_modern_inspect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_modern_inspect

## Usage

```ruby
require 'hash_modern_inspect'

hash =  {
  foo: ['FOO', {baz: 100}],
  bar: {zoo: 200},
  "hoge"=>"piyo"
}

hash.modern_inspect
#=> '{foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "hoge"=>"piyo"}'

hash.modern_inspect_without_brace
#=> 'foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "hoge"=>"piyo"'

{}.modern_inspect_without_brace
#=> "{}"

{}.modern_inspect_without_brace(allow_empty: true)
#=> ""
```
