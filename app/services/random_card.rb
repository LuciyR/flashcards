class RandomCard

  def self.call
    Card.where("review_date <= ?", DateTime.current).order("RANDOM()")
                                                    .limit(1).first
  end
end
