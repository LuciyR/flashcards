class CheckAnswer
  attr_accessor :answer

  def self.call(card, answer)
    if card.original_text.downcase == answer.downcase
      card.update(review_date: 3.days.since)
      return true
    else
      return false
    end
  end
end
