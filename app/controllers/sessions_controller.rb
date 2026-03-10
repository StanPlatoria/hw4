class SessionsController < ApplicationController
  def new
  end

def create
  @user = User.find_by({ "email" => params["email"] })

  if @user
    bcrypt_password = BCrypt::Password.new(@user["password"])

    if bcrypt_password == params["password"]
      session["user_id"] = @user["id"]
      flash["notice"] = "Welcome back, #{@user["username"]}!"
      redirect_to "/places"
    else
      flash["notice"] = "Invalid password."
      redirect_to "/login"
    end
  else
    flash["notice"] = "Email not found."
    redirect_to "/login"
  end
end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Logged out successfully."
    redirect_to "/login"
  end
end