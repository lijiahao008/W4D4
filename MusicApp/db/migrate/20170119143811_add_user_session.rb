class AddUserSession < ActiveRecord::Migration
  def change
    remove_column :users, :seesion_token
    add_column :users, :session_token, :string, null: false,
    unique: true
  end
end
