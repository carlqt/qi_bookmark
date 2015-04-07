class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shared_users
  has_many :shared_links, through: :shared_users, source: :link
  has_many :links

  accepts_nested_attributes_for :shared_users

  validates :username, uniqueness: true
end
