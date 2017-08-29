class RoundsController < ApplicationController
  def create
    @round = Round.new
    @round.user = current_user
    @round.deck = Deck.find(params[:deck_id])
    @round.save
    redirect_to round_card_path(@round, 1)
  end
end
