Learncodebeta::Application.routes.draw do
  root to: "offline_schools#index"
  resources :offline_schools
end
