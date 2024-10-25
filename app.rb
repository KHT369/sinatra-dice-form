require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)
end

get("/process_roll")do
  @num_dice = params.fetch("dice").to_i
  
  @num_sides = params.fetch("sides").to_i
  
  @rolls = []

  @num_dice.times do
    die = rand(1...@num_sides)

    @rolls.push(die)
  end

  erb(:processroll)
end

