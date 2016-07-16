class User < ActiveRecord::Base
  devise :database_authentticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
end
