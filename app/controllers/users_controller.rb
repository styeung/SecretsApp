class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:index, :show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      #changed from user_url(user)
      redirect_to users_url
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    if !params.include?(:id)
      redirect_to user_url(current_user)
      return
    end
    @tags = Tag.all
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

