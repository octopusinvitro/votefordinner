require 'sinatra'
require 'sprockets'

require './lib/messages'
require './lib/vote_assets'
require './lib/vote'

extend Messages
run Vote
