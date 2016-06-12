require 'vote'

describe 'Vote' do

  include Rack::Test::Methods

  def app
    Vote.new
  end

  it 'uses template in the main title' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Welcome to the Suffragist!</h1>')
    expect(last_response.body).to include('What\'s for dinner?')
  end

  it 'adds the possibility to POST  results' do
    post '/cast', :vote => 'HAM'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Thanks for casting your vote!</h1>')
    expect(last_response.body).to include('Hamburger')
  end

  it 'adds the results route and the results view' do
    get '/results'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Results so far:</h1>')
    expect(last_response.body).to include('<th>Curry</th>')
    # expect(last_response.body).to include('<td>3</td>')
    # expect(last_response.body).to include('<td>###</td>')
  end

end
