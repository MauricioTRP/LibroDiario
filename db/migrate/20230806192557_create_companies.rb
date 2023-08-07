class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :formal_name
      t.string :rut
      t.json :contact_info
      t.json :address
      t.string :line_of_business

      t.timestamps
    end
    add_index :companies, :rut, unique: true
  end
end
