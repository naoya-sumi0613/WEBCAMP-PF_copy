Rails.application.routes.draw do

  namespace :users do
    get 'likes/index'
  end
  root 'users/homes#top'
  devise_for :admins


  scope module: :users do
  	devise_for :users, controllers: {
  		sessions: 'users/sessions',
  		registrations: 'users/registrations',
  		passwords: 'users/passwords'
  	}
    get 'homes/about'
    resources :users, only: [:show, :edit, :update, :destroy] do
      get :retire, on: :member
    end
    resources :photos, only: [:index, :new, :create, :show, :destroy, :update] do
      resources :comments, only: [:index, :create, :destroy, :update]
      resources :likes, only: [:index, :create, :destroy]
    end
    resource :contacts, only: [:new, :create]
    get 'contacts/done' => "contacts#done"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
