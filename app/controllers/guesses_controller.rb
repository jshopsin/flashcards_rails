class GuessesController < ApplicationController
  def create
    @guess = Guess.create(guess_params)
  end

  private

  def guess_params
    params.require(:guess).permit(:guess_counter, :correct_guess, :round_id, :card_id)
  end

end
