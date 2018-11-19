class SessionsController < ApplicationController
  
   def new 
     @user = User.new
   end
  
  
   def create
     @user = User.find_by(username: params[:username])
     return head(:forbidden) unless @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect_to :welcome
    else
      flash[:notice] = "Login is incorrect"
      redirect_to :login
    end
   end
  end
 
