require 'sinatra'
require 'sinatra/reloader'
require 'pry'

number = rand(100)

get '/' do
  guess = params["guess"].to_i

  message = ""
  compare = [number, guess]
  diff = compare.max - compare.min

  if guess != 0
    if guess > number
      if diff > 5
        message = "Way too high!"
      else
        message = "Too high!"
      end
    elsif guess < number
      if diff > 5
        message = "Way too low!"
      else
        message = "Too low!"
      end
    else
      message = "You got it right!"
    end
  end

  # throw params.inspect

  erb :index, :locals => {:number => number,
                          :message => message}
end
