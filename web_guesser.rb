require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :number, rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)

  secret_message = nil
  if settings.number == guess.to_i
    secret_message = "The SECRET NUMBER is #{settings.number}"
  end

  erb :index, :locals => {:secret_message => secret_message,
                          :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  message = ""
  compare = [settings.number, guess]
  diff = compare.max - compare.min

  if guess > settings.number
    diff > 5 ? message = "Way too high!" : message = "Too high!"
  elsif guess < settings.number
    diff > 5 ? message = "Way too low!" : message = "Too low!"
  else
    message = "You got it right!"
  end
  guess == 0 ? "" : message
end
