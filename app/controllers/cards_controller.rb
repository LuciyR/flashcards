class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    if @card.save
      flash[:success] = 'Saved'
      redirect_to :show
    else
      flash[:alert] = 'Please check the form'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      flash[:success] = 'Updated'
      redirect_to :show
    else
      flash[:alert] = 'Update failed'
      render :edit
    end
  end

  def destroy
    @card.destroy
    flash[:success] = 'Deleted'
    redirect_to root_path
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
