Rails.application.routes.draw do
  devise_for :authors, controllers: {
    confirmation: 'confirmation'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  resources :authors, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
end

get '/posts/:id/newcomment', to: "comments#new_comment"
post '/addcomment/:id', to: "comments#add_comment"
post '/addlike/:id', to: "likes#add_like"
root "authors#index"

end
