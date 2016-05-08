class UserPreferencesController < ApplicationController
  def show

  end

  def new
    @user_preference = UserPreference.new
  end

  def create
    id = session[:user_id]
    user_preference = add_query(id, params[:preferences])
  end

  private

    def add_query(id, preferences)
      if @user_preference = UserPreference.find_by(UID: id)
        preferences[:category] = @user_preference[:category] + "%7C" + preferences[:category]
        if @user_preference.update(user_preference_params)
          flash[:success] = "Preference saved"
          redirect_to '/news'
        else
        render 'new'
        end
      else
        preferences[:UID] = id
        @user_preference = UserPreference.new(user_preference_params)
        if @user_preference.save(preferences)
          flash[:success] = "Preference saved"
          redirect_to '/news'
        else
          render 'new'
        end
      end
    end

    def user_preference_params
      user_prefs = params.require(:preferences).permit(:category, :UID)
    end

end
