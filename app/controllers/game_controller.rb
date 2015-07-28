class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  def rps

    @user_move = params["the_move"]

    @computer_move = ["rock", "paper", "scissors"].sample

    if @user_move == @computer_move
      @outcome = "tied"
    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "won"
    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "won"
    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "lost"
    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "won"
    end

    @all_moves = Move.all
    new_row = Move.new
    new_row.computer_move = @computer_move
    new_row.user_move = @user_move
    if @outcome == "won"
      new_row.computer_wins = 0
      new_row.user_wins = 1
      new_row.tie = 0
    elsif @outcome == "lost"
      new_row.computer_wins = 1
      new_row.user_wins = 0
      new_row.tie = 0
    else
      new_row.computer_wins = 0
      new_row.user_wins = 0
      new_row.tie = 1
    end
    new_row.save


    render("move.html.erb")

  end

end
