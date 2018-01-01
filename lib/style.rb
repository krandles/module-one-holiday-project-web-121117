class Style < ActiveRecord::Base
  has_many :beers

  def self.list
    puts "ID   Name"
    all.each do |style|
      puts "#{style.id} #{style.name}"
    end
  end
end