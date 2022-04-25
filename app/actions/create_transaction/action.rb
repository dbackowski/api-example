module CreateTransaction
  class Action < BaseAction::Action
    def call(request)
      result = auth_deserialize_validate(request)
      return result unless result.success?

      # here should be saving data with model

      return Result.new(success?: true, value: result.value)
    end
  end
end
