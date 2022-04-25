class TokensController < ApplicationController
  def create
    call_action
  end

  private

  def action
    CreateToken::Action.new
  end
end
