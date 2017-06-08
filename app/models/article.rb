class Article < ActiveRecord::Base
  belongs_to :user
  validate :check_for_publish_date
end
