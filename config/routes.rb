Rails.application.routes.draw do
  if Rails.env.development?
    # add the url of your end-point to graphql_path.
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  namespace :api, default: { format: 'json' } do
    resources :resouce
  end
  # default
  # post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
