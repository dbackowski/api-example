module BaseAction
  class Authorizer
    Result = ActionResult

    def call(request)
      token = request.headers['Authorization'].to_s
      token.length.zero? ? Result.new(success?: false, error: :authorize) : Result.new(success?: true)
    end
  end
end
