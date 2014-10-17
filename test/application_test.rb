$:.unshift File.expand_path('../lib/', File.dirname(__FILE__))
require 'florida'

class MyApplication < Florida::Application
  get '/' do
    'Hello florida!'
  end
end

MyApplication.run
