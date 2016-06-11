require 'vote'

describe 'Vote' do

  include Rack::Test::Methods

  def app
    Vote.new
  end

  it 'says hello voter' do
  # def test_it_says_hello_voter
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Hello, voter!')
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end

end
