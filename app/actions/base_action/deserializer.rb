module BaseAction
  class Deserializer
    Result = ActionResult

    def call(request)
      block = self.class.singleton_class.instance_variable_get(:@block) || empty_permit_params

      params = block.call(ActionController::Parameters.new(request.params))
      Result.new(success?: true, value: params.to_h)
    rescue ActionController::ParameterMissing, ActionController::UnpermittedParameters
      Result.new(success?: false, error: :deserialize)
    end

    def self.permit_params(block)
      self.singleton_class.instance_variable_set(:@block, block)
    end

    private

    def empty_permit_params
      -> (params) { params.require(:non_existing) }
    end
  end
end
