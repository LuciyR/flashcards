class Card < ApplicationRecord
  attr_accessor :image_cache
  before_create :set_review_date
  mount_uploader :image, ImageUploader

  validates :original_text, :translated_text, presence: true
  validate :cards_text_cannot_match

  belongs_to :user

  protected

  def set_review_date
    self.review_date = Time.now + 3.days
  end

  def cards_text_cannot_match
    unless translated_text.nil?
      if self.original_text.downcase == self.translated_text.downcase
        errors.add(:translated_text, 'Перевод должен отличаться от оригинала')
      end
    end
  end
end
