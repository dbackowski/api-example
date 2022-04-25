module CreateTransaction
  class Validator < BaseAction::Validator
    attr_accessor :token, :currency, :amount

    validates :token, presence: true
    validates :currency, presence: true
    validates :amount, presence: true
  end
end
