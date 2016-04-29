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
    query = get_query
    @r = HTTParty.get(query)
    @length = @r["response"]["results"].length
  end

  def pref
  end

  def addPref
    @user_preference = UserPreference.new(user_preference_params)
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:password, :password_confirmation)
    end

    def user_preference_params
      params.require(:user_preference).permit(:source, :category)
    end

    def get_query
      time = Time.now
      year = time.year
      month = time.month
      day = time.day
      query = "http://content.guardianapis.com/search?from-date=#{year}-#{month}-#{day}&section=politics&q=politics&api-key=test"
    end


end
