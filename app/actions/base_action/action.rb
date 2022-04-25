module BaseAction
  class Action
    Result = ActionResult

    def initialize
      @authorizer = BaseAction::Authorizer.new
      @deserializer = deserializer_class_name.new
      @validator = validator_class_name
    end

    def call(request)
      raise NotImplementedError
    end

    def auth_deserialize_validate(request)
      result = authorizer.call(request)
      return result unless result.success?

      result = deserializer.call(request)
      return result unless result.success?

      result = validator.call(result.value)
      return result unless result.success?

      Result.new(success?: true, value: result.value)
    end

    private

    def action_name
      "::#{self.class.name.split('::').first}"
    end

    def deserializer_class_name
      "#{action_name}::Deserializer".constantize
    end

    def validator_class_name
      "#{action_name}::Validator".constantize
    end

    attr_accessor :deserializer, :validator, :authorizer
  end
end
