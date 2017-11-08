class AddBalanceValuesToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :before_sender_balance, :integer
    add_column :transactions, :after_sender_balance, :integer
    add_column :transactions, :before_receiver_balance, :integer
    add_column :transactions, :after_receiver_balance, :integer
  end
end
