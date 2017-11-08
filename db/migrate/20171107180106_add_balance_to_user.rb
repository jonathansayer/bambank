class AddBalanceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :balance, :integer, null: false, default: 100
  end
end
