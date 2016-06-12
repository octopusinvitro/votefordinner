require 'vote'

describe 'Vote' do

  include Rack::Test::Methods

  def app
    Vote.new
  end

  it 'uses template in the main title' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include("<title>#{Messages::MAIN_TITLE}</title>")
    expect(last_response.body).to include("<h1>#{Messages::MAIN_TITLE}</h1>")
  end

  it 'adds the possibility to POST  results' do
    post '/cast', :vote => 'HAM'
    expect(last_response).to be_ok
    expect(last_response.body).to include("<title>#{Messages::CAST_TITLE}</title>")
    expect(last_response.body).to include("<h1>#{Messages::CAST_TITLE}</h1>")
    expect(last_response.body).to include('Hamburger')
  end

  it 'adds the results route and the results view' do
    get '/results'
    expect(last_response).to be_ok
    expect(last_response.body).to include("<title>#{Messages::RESULTS_TITLE}</title>")
    expect(last_response.body).to include("<h1>#{Messages::RESULTS_TITLE}</h1>")
    expect(last_response.body).to include('<th>Curry</th>')
    # expect(last_response.body).to include('<td>3</td>')
    # expect(last_response.body).to include('<td>###</td>')
  end

end
