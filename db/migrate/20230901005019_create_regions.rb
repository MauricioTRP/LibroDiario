class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :region
      t.string :ordinal

      t.timestamps
    end
  end
end
