require 'florida/sinatra_server/controller_router'

class Florida::SinatraServer::Router
  def self.setup(app, sinatra)
    self.new(app, sinatra).routing!
  end

  def initialize(app, sinatra)
    @app = app
    @sinatra = sinatra
  end

  def routing!
    routings.each do |path, params|
      ctrl_router = Florida::SinatraServer::ControllerRouter.new(path, params[:to], params)
      ctrl_router.routing!(@sinatra)
    end
  end

  private
  def routings; @app.routings; end
end
