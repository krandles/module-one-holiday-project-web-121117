class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  def print
    puts "#{beer.name} reviewed by #{user.name} #{date.strftime("on %D")}"
    puts "Score: #{score} Comments: #{comments}\n\n"
  end
end
