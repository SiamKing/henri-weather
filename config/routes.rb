Rails.application.routes.draw do
  root "weather#home"
  get "current_weather", to: "weather#current_weather"
end
