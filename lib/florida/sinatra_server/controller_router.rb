require 'florida/router/path_matcher.rb'

class Florida::SinatraServer::ControllerRouter
  def initialize(path, controller, params)
    @path = path
    @controller = controller
    @params = params
  end

  def routing!(s)
    index_routing!(s) if new_controller.respond_to? :index
    show_routing!(s) if new_controller.respond_to? :show
  end

  private
  def index_routing!(s)
    controller = @controller
    s.get(route_matcher.of_index) do
      controller.new(self).index
    end
  end

  def show_routing!(s)
    controller = @controller
    s.get(route_matcher.of_show) do
      controller.new(self).show(self.params[:captures].first)
    end
  end

  def new_controller
    @controller.new(self)
  end

  def route_matcher
    Florida::Router::PathMatcher.new(@path)
  end
end
