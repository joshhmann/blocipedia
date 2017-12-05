class UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  
  
  def downgrade
    if current_user.premium?
      current_user.standard!
      flash[:notice] = "You have been downgraded to standard."
      redirect_to root_path
    else
      flash[:error] = "There was an error downgrading your account. Please try again."
      redirect_to edit_user_registration_path
    end
  end
end