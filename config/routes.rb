Rails.application.routes.draw do
  root "weather#home"
  get "current_weather", to: "weather#current_weather"
  get "convert_temperatures", to: "weather#convert_temperatures"
  resources :locations, only: [:create]
end
