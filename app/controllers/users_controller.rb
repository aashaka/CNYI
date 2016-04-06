class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def delete
  end

  def update
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to CNYI"
      redirect_to '/news' 
    else
      render 'new'
    end
  end

  def news
    @r = HTTParty.get("http://content.guardianapis.com/search?from-date=2016-04-05&section=politics&q=politics&api-key=test")
    @length = @r["response"]["results"].length
  end


  private

    def user_params
        params.require(:user).permit(:name,:email,:password, :password_confirmation)
    end


end
