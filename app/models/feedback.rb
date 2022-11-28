# After creating tweet, send it
class Feedback < ApplicationRecord
  before_create :sanitize
  after_create :send_tweet

  validates_presence_of :recipient_handle, :text

  validates_length_of :text, minimum: 1, maximum: 250

  def sanitize
    # logic to transform the field
    self.recipient_handle = recipient_handle.gsub('@', '')
  end

  def send_tweet
    TwitterService.tweet!(self)
  end
end
