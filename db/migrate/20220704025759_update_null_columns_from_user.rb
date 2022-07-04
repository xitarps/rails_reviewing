class UpdateNullColumnsFromUser < ActiveRecord::Migration[6.1]
  def change
    User.update_all(first_name: 'undefined', last_name: 'undefined', username: 'undefined' )
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name,  :string, null: false
    change_column :users, :username,   :string, null: false
  end
end
