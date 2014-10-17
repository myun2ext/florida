class Florida::SinatraServer::Router
  def initialize(app, sinatra)
    @app = app
    @sinatra = sinatra
  end

  def self.setup(app, sinatra)
    self.new(app, sinatra).routing!
  end

  def routing!
    @app.routings.each do |path, data|
      setup_routing(path, data)
    end
  end

  private
  def setup_routing(path, params)
    controller_class = params[:to]
    controller = controller_class.new

    if controller.respond_to? :index
      @sinatra.get self.class.index_routing_matcher(path) do
        controller_class.new(self).index
      end
    end

    if controller.respond_to? :show
      @sinatra.get(self.class.show_routing_matcher(path)) do
        klass.new(self).show(params[:captures].first)
      end
    end
  end

  def self.index_routing_matcher(path)
    %r{\A#{path}(\.[\w]+)?/?\z}
  end

  def self.show_routing_matcher(path)
    %r{\A#{path}/(\w+)(\.[\w]+)?/?\z}
  end
end
