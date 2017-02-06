class User < ApplicationRecord
  has_many :cards, dependent: :destroy
end
