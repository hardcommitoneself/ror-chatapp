class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])

    if user
      logIn(user)
    else
      render "new"
    end
  end

  def destroy
    logOut if loggedIn?

    redirect_to root_path
  end
end
