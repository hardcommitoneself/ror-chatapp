class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :currentUser

  def currentUser
    if session[:user_id]
      @currentUser = User.find(session[:user_id])
    end
  end

  def logIn(user)
    session[:user_id] = user.id

    @currentUser = user

    redirect_to root_path
  end

  def loggedIn?
    !currentUser.nil?
  end

  def logOut
    session.delete(:user_id)
    @currentUser = nil
  end
end
