class TransactionBalanceService

  def initialize(transaction)
    @transaction = transaction
  end

  def process
    @transaction.update_attributes({
                                    before_sender_balance: sender_before,
                                    before_receiver_balance: receiver_before,
                                    after_sender_balance: sender_after,
                                    after_receiver_balance: receiver_after
                                  })
    @transaction.sender.update_attributes(balance: sender_after)
    @transaction.receiver.update_attributes(balance: receiver_after)
  end

  private

  def sender_before
    @sender_before ||= @transaction.sender.balance
  end

  def sender_after
    @sender_after ||= sender_before - @transaction.amount
  end

  def receiver_before
    @receiver_before ||= @transaction.receiver.balance
  end

  def receiver_after
    @receiver_after ||= receiver_before + @transaction.amount
  end
end