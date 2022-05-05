class ApplicationController < ActionController::API
  private

  def call_action
    result = action.call(request)

    case result
      in { success?: true }
        render json: result.value, status: :created
      in { success?: false, error: :authorize }
        head :forbidden
      in { success?: false, error: :deserialize }
        head :bad_request
      in { success?: false, error: ActiveModel::Errors }
        render json: result.error.full_messages, status: :unprocessable_entity
      else
        head 500
    end
  end
end
