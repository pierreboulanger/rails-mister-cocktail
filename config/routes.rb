Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"

  resources :cocktail do
    resources :dose, only: [:new, :create, :destroy]
  end

  root to: 'cocktail#index'
end
