class TransactionsController < ApplicationController
  def create
    call_action
  end

  private

  def action
    CreateTransaction::Action.new
  end
end
