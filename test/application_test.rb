$:.unshift File.expand_path('../lib/', File.dirname(__FILE__))
require 'florida'

class MyApplication < Florida::Application
  get '/' do
    'Hello Florida!!'
  end
end

MyApplication.run
