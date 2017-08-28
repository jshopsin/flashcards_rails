class RoundsController < ApplicationController
  def create
    @round = Round.create
    @round.user = current_user
    @round.deck = Deck.find(params[:deck_id])
    redirect_to decks_path
  end
end
