class CardsController < ApplicationController
  def new
    @card = Card.new
    @deck = Deck.find(params[:deck_id])
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    @card.deck = Deck.find(params[:deck_id])
    if @card.save
      redirect_to deck_path(@card.deck)
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer, :user_id, :deck_id)
  end
end
