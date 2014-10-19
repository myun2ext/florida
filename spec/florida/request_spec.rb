require 'florida'

ENV['RACK_ENV'] = 'test'
require 'rack/test'

describe Florida do
  describe "Application" do
    include Rack::Test::Methods

    let!(:example_application) do
      class HomeController < Florida::Controller::Base
        def index
          'Hello Florida!!'
        end
      end

      class ExampleController < Florida::Controller::Base
        def index
          'This is example index page.'
        end

        def show(id)
          "This is example of #{id}"
        end
      end

      class MyApplication < Florida::Application::Base
        routings do
          path "/", to: HomeController
          path "/examples", to: ExampleController
        end
      end
      MyApplication
    end

    def app
      Florida::SinatraServer.new(example_application).application
    end

    describe "access to /" do
      before do
        get '/'
      end
      it { expect(last_response).to be_ok }
      it { expect(last_response.body).to eq 'Hello Florida!!' }
    end

    describe "access to /examples" do
      before do
        get '/examples'
      end
      it { expect(last_response).to be_ok }
      it { expect(last_response.body).to eq 'This is example index page.' }
    end

    describe "access to /examples/1" do
      before do
        get '/examples/1'
      end
      it { expect(last_response).to be_ok }
      it { expect(last_response.body).to eq 'This is example of 1' }
    end
  end
end
