Rails.application.routes.draw do

  root 'users/homes#top'
  devise_for :admins
  devise_for :users

  scope module: :users do
    get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
