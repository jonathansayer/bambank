class TransactionsController < ApplicationController

  def index
    @balance = current_user.balance
    @sent_transactions = current_user.sent_transactions
    @received_transactions = current_user.received_transactions
  end

  def new
    @users = User.all.reject{ |user| user == current_user }
  end

  def create
    transaction = Transaction.new(transaction_params.merge(sender_id: current_user.id))
    if transaction.save!
      flash[:notice] = "You transaction has been sent"
      redirect_to transactions_path
    else
      flash[:error] = "There was an error with your transaction"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :receiver_id)
  end
end