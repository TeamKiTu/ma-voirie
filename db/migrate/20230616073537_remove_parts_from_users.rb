class RemovePartsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone_number
    remove_column :users, :age
  end
end
