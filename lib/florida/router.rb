module Florida::Router
  def path(path, options = {})
    @routings ||= {}
    @routings[path] = options
  end

  def routings(&block)
    if block_given?
      block.call
    else
      @routings
    end
  end
end
