class Card < ApplicationRecord
  before_create :set_review_date
  validates :original_text, :translated_text, presence: true
  validate :cards_text_cannot_match

  protected

  def set_review_date
    self.review_date = Time.now + 3.days
  end

  def cards_text_cannot_match
    if original_text == translated_text
      errors.add(:translated_text, 'Перевод должен отличаться от оригинала')
    end
  end
end
