Rails.application.routes.draw do
  resources :events
  # get 'events/:id/add_attendee', to: 'attendees#new', as: 'attendee'
  # post 'events/:id/add_attendee', to: 'attendees#create'
  resources :attendees, except: [:index, :show]

  get 'pages/home'
  devise_for :users, path: '', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'},
  controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
end