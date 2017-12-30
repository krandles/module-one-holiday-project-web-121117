class Beer < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :style
  belongs_to :brewery
end