class UserPreferencesController < ApplicationController
  def show

  end

  def new
    @user_preference = UserPreference.new
  end

  def create
    @user_preference = UserPreference.new(user_preference_params)
    if @user_preference.save
      flash[:success] = "Preference saved"
      redirect_to '/news'
    else
      render 'new'
    end
  end

  private

    def user_preference_params
      params[:preferences][:UID] = session[:user_id]
      user_prefs = params.require(:preferences).permit(:source, :category, :UID)
    end
end
