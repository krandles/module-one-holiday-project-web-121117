class Brewery < ActiveRecord::Base
  has_many :beers
  has_many :reviews, through: :beers
  has_many :styles, through: :beers

  def self.list
    all.each do |b|
      puts "#{b.id}. #{b.name}"
    end
  end

  def average_score
    return "n/a" if reviews.empty?
    scores = reviews.map(&:score)
    total = 0
    scores.each do |score|
      total += score
    end
    total / scores.length
  end

  def average_abv
    return "n/a" if beers.empty?
    abvs = beers.map(&:abv)
    total = 0
    abvs.each do |abv|
      total += abv
    end
    avg = total / abvs.length
    avg.round(2)
  end
end
