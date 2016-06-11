require 'sinatra'

class Vote < Sinatra::Base

  get '/' do
    'Hello, voter!'
  end

end
