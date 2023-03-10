Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboard#index'
  scope '/:type' do 
    resources :topics do
      collection do
        post :clear_history
      end
    end
  end
end
