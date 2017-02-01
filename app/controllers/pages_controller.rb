class PagesController < ApplicationController
  def index
    @card = RandomCard.call
  end

  def check_card
    @card = Card.find(params[:id])
    if CheckAnswer.call(@card, answer_params[:answer])
      flash[:notice] = 'Верно!'
    else
      flash[:notice] = "Вы ошиблись. Правильный ответ: #{@card.original_text}"
    end
    redirect_to root_url
  end

  private

  def answer_params
    params.permit(:answer)
  end
end
