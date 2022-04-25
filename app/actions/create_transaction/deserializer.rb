module CreateTransaction
  class Deserializer < BaseAction::Deserializer
    permit_params -> (params) { params.require(:transaction).permit(:token, :currency, :amount) }
  end
end
