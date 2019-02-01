Rails.application.routes.draw do

  resources :categories do
    resources :movies do
    end
  end

  root 'categories#index'

end
