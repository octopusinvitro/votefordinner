# frozen_string_literal: true

require 'vote'

RSpec.describe 'Vote' do
  def app
    Vote.new
  end

  it 'uses template in the main title' do
    get '/'
    expect(last_response).to be_ok
    expect_titles(Messages::MAIN_TITLE)
  end

  it 'adds the possibility to POST  results' do
    post '/cast', vote: 'HAM'
    expect(last_response).to be_ok
    expect_titles(Messages::CAST_TITLE)
    expect(last_response.body).to include('Hamburger')
  end

  it 'adds the results route and the results view' do
    get '/results'
    expect(last_response).to be_ok
    expect_titles(Messages::RESULTS_TITLE)
    expect(last_response.body).to include('<th>Curry</th>')
    # expect(last_response.body).to include("<td>3</td>")
    # expect(last_response.body).to include("<td>###</td>")
  end

  it 'renders the error page if there is an error' do
    get '/unknown_path'
    expect(last_response.status).to eq(404)
    expect_titles(Messages::NOT_FOUND)
  end

  def expect_titles(title)
    expect(last_response.body).to include("<title>#{title}</title>")
    expect(last_response.body).to include("<h1>#{title}</h1>")
  end
end
