class UsersController < ApplicationController
	before_action :signed_in_user, only: :show
  def show
  	@user = User.find(params[:id])
  end

  def new
  end
end
