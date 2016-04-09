# HashModernInspect

Inspect Hash object as modern format.

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

hash =  {
  foo: ['FOO', {baz: 100}],
  bar: {zoo: 200},
  "hoge"=>"piyo"
}

hash.modern_inspect
#=> '{foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "hoge"=>"piyo"}'

hash.modern_inspect_without_brace
#=> 'foo: ["FOO", {baz: 100}], bar: {zoo: 200}, "hoge"=>"piyo"'
```
