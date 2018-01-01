class Beer < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :style
  belongs_to :brewery

  def average_score
    scores = reviews.map(&:score)
    total = 0
    scores.each do |score|
      total += score
    end
    if total.zero?
      'n/a'
    else
      total / scores.length
    end
  end
end
