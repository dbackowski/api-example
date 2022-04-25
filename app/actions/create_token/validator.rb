module CreateToken
  class Validator < BaseAction::Validator
    attr_accessor :first_name, :last_name

    validates :first_name, presence: true
    validates :last_name, presence: true
  end
end
