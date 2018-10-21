Rails.application.routes.draw do
  devise_for :users

  devise_for :users,controllers: { sessions: 'user/sessions', registrations: 'user/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
