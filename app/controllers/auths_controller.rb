class AuthsController < ApplicationController
  def new
    if current_user
      redirect_to users_path
    else
      @user = User.new
    end
  end
  
  def create
    user = User.where(username: params[:user][:username])
    if user.count > 0
      @user = user[0]
      if @user.passes_authentication?(params[:user][:password])
        if @user.is_verified?
          session[:user_id] = @user.id
          redirect_to users_path
        else
          redirect_to new_auth_path
          flash[:error] = "Please check your e-mail and verify your identity." #add button for resending e-mail
        end
      else
        redirect_to new_auth_path
        flash[:error] = 'Invalid username and/or password.  Please try again.'
      end
    else
      redirect_to new_auth_path
      flash[:error] = 'Invalid username and/or password.  Please try again.'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to new_auth_path
  end

end
