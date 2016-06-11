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
    erb :index
  end

end
