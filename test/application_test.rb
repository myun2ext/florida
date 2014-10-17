$:.unshift File.expand_path('../lib/', File.dirname(__FILE__))
require 'florida'

class MyApplication < Florida::Application::Base
  get '/' do
    'Hello Florida!!'
  end
end

Florida::SinatraServer.run(MyApplication)
