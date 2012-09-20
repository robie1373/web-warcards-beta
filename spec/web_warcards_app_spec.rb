require "./app"
require "minitest/spec"
require "rack/test"

set :environment, :test

describe "app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    last_response.should.be.ok
    last_response.should.equal 'hello'
  end
end