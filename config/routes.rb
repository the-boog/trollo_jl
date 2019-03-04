Rails.application.routes.draw do
  root "boards#index"

  post 'boards/alphabetize', 'boards#alphabetize'
  post 'boards/date', 'boards#date'

  
  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
    post 'tasks/alphabetize', 'tasks#alphabetize'
    post 'tasks/date', 'tasks#date'
    post 'tasks/priority', 'tasks#priority'
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


