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

    def user_preference_params
      
      user_prefs = params.require(:preferences).permit(:source, :category, :UID)
    end

    def add_query(id, preferences)
      if user_preference = UserPreference.find_by(UID: id)
        preferences[:source] = user_preference[:source] + "%20OR%20" + preferences[:source]
        preferences[:category] = user_preference[:category] + "%20OR%20" + preferences[:category]
        if user_preference.update(source: preferences[:source], category: preferences[:category])
          flash[:success] = "Preference saved"
          redirect_to '/news'
        else
        render 'new'
        end
      else
        preferences[:UID] = id
        if user_preference.save(preferences)
          flash[:success] = "Preference saved"
          redirect_to '/news'
        else
          render 'new'
        end
      end
    end

end
