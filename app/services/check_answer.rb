class CheckAnswer
  attr_reader :answer

  def self.call(card, answer)
    if card.original_text.downcase == answer.downcase
      card.update(review_date: 3.days.since)
      'Верно!'
    else
      "Вы ошиблись. Правильный ответ: #{card.original_text}"
    end
  end
end
