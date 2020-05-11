Rails.application.routes.draw do

  namespace :users do
    get 'users/show'
    get 'users/edit'
    get 'users/retire'
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
    resource :contacts, only: [:new, :create]
    get 'contacts/done' => "contacts#done"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
