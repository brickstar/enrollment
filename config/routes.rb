Rails.application.routes.draw do
  resources :students, shallow: true do
    resources :addresses
  end

  resources :courses, only: [:show]
end
