module Florida::Application; end
require 'florida/router'
require 'florida/controller/base'

module Florida
  module Application
    class Base
      extend Florida::Router
    end
  end
end
