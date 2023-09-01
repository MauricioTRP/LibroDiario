class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :provincia
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
