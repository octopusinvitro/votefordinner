require 'vote'

describe 'Vote' do

  include Rack::Test::Methods

  def app
    Vote.new
  end

  it 'says whats for dinner' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('What\'s for dinner?')
  end

  it 'uses template in the main title' do
    get '/'
    expect(last_response.body).to include('<h1>Welcome to the Suffragist!</h1>')
  end

end
