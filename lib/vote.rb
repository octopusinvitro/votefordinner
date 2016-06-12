require 'sinatra'
require 'yaml/store'

class Vote < Sinatra::Base

  set :views,  "#{settings.root}/../views"
  Choices = Messages::CHOICES

  get '/' do
    @title = Messages::MAIN_TITLE
    erb :index
  end

  post '/cast' do
    @title = Messages::CAST_TITLE
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
    @title = Messages::RESULTS_TITLE
    @store = YAML::Store.new 'votes.yml'
    @votes = @store.transaction { @store['votes'] }
    erb :results
  end
  # get '/assets' do
  #   run VoteAssets.environment Sinatra::Application.settings.root
  # end

end
