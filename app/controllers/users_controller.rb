class UsersController < ApplicationController

  # disabled new user signup for now. I want to be the sole user.
  
  #def new
  #  @user = User.new
  #end

  #def create
  #  @user = User.new(params[:user])
  #  if @user.save
  #    session[:user_id] = @user.id
  #    redirect_to root_url
  #    flash[:notice] = "Successfully signed up!"
  #  else
  #    render "new"
  #  end
  #end
end
