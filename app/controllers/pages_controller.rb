class PagesController < ApplicationController
  def index
    @card = RandomCard.call
  end

  def check_card
    @card = Card.find(params[:id])
    result = CheckAnswer.call(@card, answer_params[:answer])
    redirect_to root_url, notice: result
  end

  private

  def answer_params
    params.permit(:answer)
  end
end
