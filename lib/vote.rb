require 'sinatra'

class Vote < Sinatra::Base

  set :views,  "#{settings.root}/../views"

  Choices = {
    'HAM' => 'Hamburger',
    'PIZ' => 'Pizza',
    'CUR' => 'Curry',
    'NOO' => 'Noodles',
  }

  get '/' do
    @title = 'Welcome to the Suffragist!'
    erb :index
  end

  post '/cast' do
    @title = 'Thanks for casting your vote!'
    @vote  = params['vote']
    erb :cast
  end

  get '/results' do
    @title = 'Results so far:'
    @votes = { 'HAM' => 7, 'PIZ' => 5, 'CUR' => 3 }
    erb :results
  end
  # get '/assets' do
  #   run VoteAssets.environment Sinatra::Application.settings.root
  # end

end
