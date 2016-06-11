require 'vote'

describe 'Vote' do

  include Rack::Test::Methods

  def app
    Vote.new
  end

  it 'says hello voter' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('What"s for dinner?')
  end

end
