class SessionsController < ApplicationController
  
   def create
     @user = User.find_by(username: params[:username])
     return head(:forbidden) unless @user.authenticate(params[:password])
     session[:user_id] = @user.id
   end
  end
 
# app/models/user.rb
  class User < ActiveRecord::Base
    has_secure_password
end
end