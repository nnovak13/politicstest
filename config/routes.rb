Rails.application.routes.draw do
  root "legislators#home"
  resources :legislators

post '/search' => 'legislators#search'
# get '/home' => 'legistlators#home'
end

#set up all controller's views,
# create the method that allows them to search for the legislator by last name
#set up form
#get info, pass back, iterate for columns
