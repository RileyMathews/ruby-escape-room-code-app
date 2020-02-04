# frozen_string_literal: true

require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  if params[:game_code] == ENV['GAME_CODE']
    erb :victory
  else
    @failure = true
    erb :index
  end
end
