class AddUserToMustdos < ActiveRecord::Migration
  def change
    add_column :mustdos, :user_id, :integer
    add_index :mustdos, :user_id
  end
end
