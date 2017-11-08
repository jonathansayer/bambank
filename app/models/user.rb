class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_transactions, class_name: "Transaction", foreign_key: "sender_id"
  has_many :received_transactions, class_name: "Transaction", foreign_key: "receiver_id"

  validates :full_name, :email, presence: true

  def to_s
    full_name
  end
end
