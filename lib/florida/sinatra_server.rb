require 'sinatra'
require 'rack'

module Florida
  class SinatraServer
    def initialize(app, params = {})
      @sinatra = Class.new(Sinatra::Base)
      @params = params
    end

    def run
      Rack::Server.start(app: @sinatra.new, Port: @params[:port] || 4567)
    end

    def self.run(app, params = {})
      self.new(app, params).run
    end
  end
end
