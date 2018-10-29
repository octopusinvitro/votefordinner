# frozen_string_literal: true
require 'sassc'

module VoteAssets
  def self.included(klass)
    # configure do
    #   set :sass, style: :compressed
    # end
    # binding.pry
    # SassC::Engine.new(File.read('assets/css/main.scss'), style: :compressed).render

    # klass.get '/assets/*' do
    #   env['PATH_INFO'].sub!('/assets', '')
    #   klass.settings.environment.call(env)
    # end
  end
end
