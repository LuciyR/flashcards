require 'rails_helper'

describe User do
  it {have_many :cards}
end
