# frozen_string_literal: true

require 'sassc'
require 'sinatra'
require 'yaml/store'

require_relative 'messages'

class Vote < Sinatra::Base
  include Messages
  Choices = Messages::CHOICES

  set :views, "#{settings.root}/../views"
  set :sass_dir, "#{settings.root}/../assets/css"

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

  get '/assets/main.css' do
    content_type 'text/css', charset: 'utf-8'
    template = File.read(File.join(settings.sass_dir, 'main.scss'))
    SassC::Engine.new(template, style: :compact).render
    # sass(:main, style: :compact)
  end


  not_found do
    status 404
    @title = Messages::NOT_FOUND
    erb :not_found
  end
end
