class Florida::Router::PathMatcher
  def initialize(path)
    @path = path; end

  def of_index
    %r{\A#{@path}(\.[\w]+)?/?\z}; end

  def of_show
    %r{\A#{@path}/(\w+)(\.[\w]+)?/?\z}; end
end
