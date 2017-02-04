require 'rails_helper'

describe CheckCard do
  let(:card) {create(:card)}

  describe 'check card service' do
    it 'is find random card with correct review date' do
      checked_card = create(:card)
      checked_card.update_attributes(review_date: Time.now - 4.days)
      expect(CheckCard.call).to eq(checked_card)
    end

    context 'check card with valid parameters' do
      it 'is compare correct answer with original text' do
        expect(CheckCard.answer(card, card.original_text)).to eq('Верно!')
      end

      it 'is compare incorrect answer with original text' do
        incorrect = CheckCard.answer(card, card.translated_text)
        result = "Вы ошиблись. Правильный ответ: #{card.original_text}"
        expect(incorrect).to eq(result)
      end

      it 'is set review date if answer is correct' do
        correct = CheckCard.answer(card, card.original_text)
        date = Date.current + 3.days
        expect(card.review_date).to eq(date)
      end
    end
  end
end
