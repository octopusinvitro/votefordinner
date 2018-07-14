# frozen_string_literal: true

require 'sinatra'
require 'sprockets'

require './lib/messages'
require './lib/vote_assets'
require './lib/vote'

run Vote
