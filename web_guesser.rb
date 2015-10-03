require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'pry'

number = rand(100)

get '/' do
  erb :index, :locals => {:number => number}
end
