class Ystweet < ActiveRecord::Base
  validates :content, presence: true
  validates :content, length: { maximum: 144 }  
end
