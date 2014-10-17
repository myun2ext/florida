# Florida

**Florida** is `Sinatra` Based simple Web Application framework.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'florida'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install florida

## Usage

write application ruby script.

```ruby
require 'florida'

class MyApplication < Florida::Application
  get '/' do
    'Hello Florida!!'
  end
end

MyApplication.run
```

and script execute in ruby.

```sh
$ ruby example.rb
[2014-10-17 20:23:52] INFO  WEBrick 1.3.1
[2014-10-17 20:23:52] INFO  ruby 2.0.0 (2014-05-08) [x86_64-linux]
[2014-10-17 20:23:52] WARN  TCPServer Error: Address already in use - bind(2)
[2014-10-17 20:23:52] INFO  WEBrick::HTTPServer#start: pid=21616 port=4567
```

Access to Your WebBrowser in `http://localhost:4567`.

Show `Hello Florida!!` Text!!

## Contributing

1. Fork it ( https://github.com/myun2ext/florida/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
