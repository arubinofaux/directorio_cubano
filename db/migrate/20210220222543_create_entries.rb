class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
