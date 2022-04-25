module BaseAction
  class ActionResult < Struct.new(:success?, :value, :error, keyword_init: true); end
end
