Rails.application.routes.draw do

  get 'welcome/index'
  resources :photos

  resources :articles do
    collection do
      get 'my_articles'
    end
    resources :comments
  end
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
