Rails.application.routes.draw do
  resources :events
  get 'pages/home'
  devise_for :users, path: '', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'},
  controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
end