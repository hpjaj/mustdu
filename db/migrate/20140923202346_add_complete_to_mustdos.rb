class AddCompleteToMustdos < ActiveRecord::Migration
  def change
    add_column :mustdos, :complete, :boolean, default: false
  end
end
