ActionController::Routing::Routes.draw do |map|
 
  map.resources :faq,  {:singular=>"faq"},  :has_many => :comments

  map.resources :faq_admin, {:singular=>"faq_adm"}

  

  map.resources :users

  map.resource :account

  map.resources :users, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }
 
  map.resources :study_cases, :has_many => :comments do |study_cases|
    study_cases.resources :events
  end
  
  map.resources :comments
  
  
  map.resources :events, :member => {:timeline => :get}
  
  
  map.home '/home', :controller => 'home', :action =>'index'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login',  :controller => 'accounts', :action => 'new'
  map.logout '/logout', :controller => 'accounts', :action => 'destroy'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'users', :action => 'forgot_password'
  map.reset_password '/reset_password/:id', :controller => 'users', :action => 'reset_password'
  
  #this routes will be able to return in execution time a timeline
  map.timeline 'study_cases/:id/timeline.:format', :controller => 'events' , :action => 'timeline'
  map.root :controller => 'home'
  
  #map.root :controller => 'home'
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
   
end