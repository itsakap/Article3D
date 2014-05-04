class UsersController < ApplicationController

  def new
    unless current_user
        @user = User.new
    else redirect_to articles_path
    end
  end

  def create
    creation = params.require(:user).permit(:username, :email_address,:password, :password_confirmation)
    @user = User.new(creation)
    if creation[:password] == creation[:password_confirmation] && @user.save
      

      redirect_to new_auth_path
      flash[:notice] = "A confirmation e-mail has been sent to your account."
    else
      redirect_to new_user_path
      flash[:error] = @user.save ? "Please confirm your password properly." : "Username already exists."
    end
  end
end