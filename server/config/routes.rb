Rails.application.routes.draw do
  post '/pvmes_forms', to: 'pvmes_forms#create'
end
