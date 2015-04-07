class Link < ActiveRecord::Base
  belongs_to :user
  has_many :shared_users
end
