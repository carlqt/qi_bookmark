class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shared_users
  has_many :shared_links, through: :shared_users, source: :link
  has_many :links

  accepts_nested_attributes_for :shared_users
end
