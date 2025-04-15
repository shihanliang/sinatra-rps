require "sinatra"
require "sinatra/reloader"

def computer_move
  ["rock", "paper", "scissors"].sample
end

def outcome(player, computer)
  return "tied" if player == computer

  rules = {
    "rock" => "scissors",
    "paper" => "rock",
    "scissors" => "paper"
  }

  rules[player] == computer ? "won" : "lost"
end

get("/") do
  erb :home
end

["rock", "paper", "scissors"].each do |move|
  get("/#{move}") do
    @player_move = move
    @comp_move = computer_move
    @result = outcome(@player_move, @comp_move)

    @summary = "We played #{@player_move.capitalize}. They played #{@comp_move.capitalize}. We #{@result}!"

    erb :play
  end
end
