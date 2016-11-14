class UsersController < ApplicationController

  def new
    @user = User.new unless @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit :name, :email, :password
  end

end
