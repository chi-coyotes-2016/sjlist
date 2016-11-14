class SessionsController < ApplicationController

  def new
    @user = User.new unless @user
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private
  def session_params
    params.require(:session).permit :email, :password
  end

end
