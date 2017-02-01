class PagesController < ApplicationController
  def index
    @card = Card.review.first
  end

  def check_card
    @card = Card.find(params[:id])
    if @card.check_card(params[:answer])
      flash[:notice] = 'Верно!'
    else
      flash[:notice] = "Вы ошиблись. Правильный ответ: #{@card.original_text}"
    end
    redirect_to root_url
  end

  private

  def check_params
    params.permit(:answer)
  end
end
