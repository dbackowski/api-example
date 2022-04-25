module CreateToken
  class Deserializer < BaseAction::Deserializer
    permit_params -> (params) { params.require(:token).permit(:first_name, :last_name) }
  end
end
