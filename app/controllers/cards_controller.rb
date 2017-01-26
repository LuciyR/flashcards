class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card, notice: 'Карточка создана'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to @card, notice: 'Готово'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to root_path, notice: 'Карточка удалена'
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
