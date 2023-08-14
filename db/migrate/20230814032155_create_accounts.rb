class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :code
      t.string :name
      t.references :type, null: false, foreign_key: { to_table: :account_types }

      t.timestamps
    end
  end
end
