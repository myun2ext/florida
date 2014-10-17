$:.unshift File.expand_path('../lib/', File.dirname(__FILE__))
require 'florida'

class HomeController < Florida::Controller::Base
  def index
    'Hello Index!!'
  end

  def show(id)
    "This page is #{id}"
  end
end

class MyApplication < Florida::Application::Base
  routings do
    path "/", to: HomeController
  end
end

Florida::SinatraServer.run(MyApplication)
