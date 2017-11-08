class Transaction < ApplicationRecord

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :amount, :sender, :receiver, presence: true

  after_create :trigger_transaction

  private

  def trigger_transaction
    TransactionBalanceService.new(self).process
  end
end