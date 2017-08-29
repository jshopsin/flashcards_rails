Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :decks, only: [:index, :show]

  resources :decks, only: [] do
    resources :rounds, only: [:create]
  end

  resources :decks, only: [] do
    resources :cards, only: [:new, :create]
  end

  resources :cards, only: [] do
    resources :guesses, only: [:create, :update]
  end

  resources :rounds, only: [] do
    resources :cards, only: [:show]
  end

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'decks#index'

  post 'user_answer', to: 'guesses#answer'
end
