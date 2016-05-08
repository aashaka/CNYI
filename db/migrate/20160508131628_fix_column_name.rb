class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :user_preferences, :category, :subcategory
  	rename_column :user_preferences, :source, :category
	end
end
