class Card < ApplicationRecord
  after_initialize :init
  validates_presence_of :original_text, :translated_text, :review_date
  validate :cards_text_cannot_match

  protected

  def init
    self.review_date = Time.now + 3.days
  end

  def cards_text_cannot_match
    if original_text.capitalize == translated_text.capitalize
      errors.add(:translated_text, 'Перевод должен отличаться от оригинала')
    end
  end
end
