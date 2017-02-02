class CheckCard
  attr_reader :answer

  def self.call
    Card.where("review_date <= ?", DateTime.current).order("RANDOM()")
                                                    .limit(1).first
  end

  def self.answer(card, answer)
    if card.original_text.downcase == answer.downcase
      card.update(review_date: 3.days.since)
      'Верно!'
    else
      "Вы ошиблись. Правильный ответ: #{card.original_text}"
    end
  end
end
