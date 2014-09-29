Rails.application.routes.draw do
  devise_for :views
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :posts
end
