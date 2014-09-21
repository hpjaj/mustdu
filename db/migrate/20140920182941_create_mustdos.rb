class CreateMustdos < ActiveRecord::Migration
  def change
    create_table :mustdos do |t|
      t.string :description

      t.timestamps
    end
  end
end
