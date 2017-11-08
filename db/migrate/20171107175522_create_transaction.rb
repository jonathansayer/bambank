class CreateTransaction < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :sender
      t.references :receiver
      t.integer :amount
      t.timestamp
    end
  end
end
