# frozen_string_literal: true

require 'yaml/store'

require_relative 'messages'
require_relative 'vote_assets'

class Vote < Sinatra::Base
  include VoteAssets
  include Messages

  Choices = Messages::CHOICES
  set :views, "#{settings.root}/../views"

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

  not_found do
    status 404
    @title = Messages::NOT_FOUND
    erb :not_found
  end
end
