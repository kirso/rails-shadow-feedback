class Feedback < ActiveRecord::Base
  # 1. After user inserts the record
  after_create :send_tweet

  # Send tweet
  def send_tweet
    puts 'Sending tweet!'
    # insert twitter API logic here.
  end
end
