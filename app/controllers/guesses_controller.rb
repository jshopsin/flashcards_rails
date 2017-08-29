class GuessesController < ApplicationController
  def create
    @guess = Guess.create(guess_params)
    @card = Card.find_by(id: params[:card_id])
    @guess.card = @card
    @guess.guess_counter = 1
    if params[:given_answer] == @card.answer
      @guess.correct_guess = true
      @card_counter = params[:id] + 1
      redirect_to round_card_path(@guess.round_id, @card_counter)
    else
      @guess.correct_guess = false
      redirect_to round_card_path(@guess.round_id, @card)
    end
  end

  def update
    @guess = Guess.create(guess_params)
    @card = Card.find_by(id: params[:id])
    @guess.card = @card
    @guess.guess_counter += 1
    if params[:given_answer] == @card.answer
      @guess.correct_guess = true
      @card_counter = params[:id] + 1
      redirect_to round_card_path(@guess.round_id, @card_counter)
    else
      @guess.correct_guess = false
      redirect_to round_card_path(@guess.round_id, @card)
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:guess_counter, :correct_guess, :round_id, :card_id)
  end

end
