require 'sinatra'

module Florida
  class Application < Sinatra::Base
    def self.run(port: 4567)
      Rack::Server.start(app: new, Port: port)
    end
  end
end
