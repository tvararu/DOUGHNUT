class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :value
      t.string :description
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
