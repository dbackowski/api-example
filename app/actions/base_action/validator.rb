module BaseAction
  class Validator
    include ActiveModel::Model
    Result = ActionResult

    def self.call(params)
      result = self.new(params)

      return Result.new(success?: false, error: result.errors) unless result.valid?

      Result.new(success?: true, value: params)
    end
  end
end
