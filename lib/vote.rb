require 'sinatra'
require 'yaml/store'

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

    @store = YAML::Store.new 'votes.yml'
    @store.transaction do
      @store['votes'] ||= {}
      @store['votes'][@vote] ||= 0
      @store['votes'][@vote] += 1
    end

    erb :cast
  end

  get '/results' do
    @title = 'Results so far:'
    @store = YAML::Store.new 'votes.yml'
    @votes = @store.transaction { @store['votes'] }
    erb :results
  end
  # get '/assets' do
  #   run VoteAssets.environment Sinatra::Application.settings.root
  # end

end
