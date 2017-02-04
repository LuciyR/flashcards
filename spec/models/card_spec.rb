require 'rails_helper'

describe Card do
  it {should validate_presence_of(:original_text)}
  it {should validate_presence_of(:translated_text)}

  it 'has a valid factory' do
    expect(build(:card)).to be_valid
  end

  it 'has review date automatically added' do
    card = Card.create!(original_text: 'wow', translated_text: 'hei')
    expect(card.review_date).to eq(Date.current + 3.days)
  end

  context 'create new card' do
    it 'is valid if original text differ from translated text' do
      card = Card.new(original_text: 'ruby', translated_text: 'rubin')
      expect(card).to be_valid
    end

    it 'is not valid if original and translated text the same' do
      card = Card.new(original_text: 'ruby', translated_text: 'ruby')
      expect(card).to_not be_valid
    end

    it 'is case sensitive' do
      card = Card.new(original_text: 'ruBy', translated_text: 'rubY')
      expect(card).to_not be_valid
    end
  end
end
