class Brewery < ActiveRecord::Base
  has_many :beers
  has_many :reviews, through: :beers
  has_many :styles, through: :beers
end