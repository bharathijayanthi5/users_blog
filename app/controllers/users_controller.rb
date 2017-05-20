class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome #{@user.username} you have signed up successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  def edit

  end
  def update

@user = User.update(user_params)
if @user.save
  flash[:notice] = "your profile was successfully updated"
  redirect to @user
else
  render 'edit'
end
  end
  def show

    @user_articles = @user.articles.paginate(page: params[:page], per_page:5)
  end
  private
  def user_params
    params.require(:user).permit(:image, :username, :email, :password)
  end
  def set_user
      @user = User.find(params[:id])
  end
end
