class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :UID
      t.string :source
      t.string :category

      t.timestamps null: false
    end
  end
end
