class Users::UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	if @user == current_user
  		@name = "あなた"
  	else
  		@name = "#{@user.last_name}#{@user.first_name}さん"
  	end
  end

  def edit
  end

  def update
  end

  def retire
  end

  def destroy
  end
end
