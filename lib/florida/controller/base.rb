module Florida
  module Controller
    class Base
      def initialize(sinatra_app = nil)
        @sinatra_app = sinatra_app
      end

      def params
        @sinatra_app.params
      end
    end
  end
end
