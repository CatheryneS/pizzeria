class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Hmm..no user found. Please try again or signup."
      redirect_to '/login'
    end
  end

  def create_facebook
    
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.urlsafe_base64
      u.save
    end

    session[:user_id] = @user.id
    render 'welcome/index'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
