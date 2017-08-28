class DecksController < ApplicationController

  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find_by(id: params[:id])
    @cards = @deck.cards
  end

end
