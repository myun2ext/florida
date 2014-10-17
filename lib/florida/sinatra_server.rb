require 'sinatra'
require 'rack'

class Florida::SinatraServer; end
require 'florida/sinatra_server/router'

module Florida
  class SinatraServer
    def initialize(app, params = {})
      @sinatra_app = Class.new(Sinatra::Base)
      @params = params
      setup(app)
    end

    def run
      Rack::Server.start(app: @sinatra_app.new, Port: @params[:port] || 4567)
    end

    def self.run(app, params = {})
      self.new(app, params).run
    end

    private
    def setup(app)
      Router.setup(app, @sinatra_app)
    end
  end
end
