class User < ApplicationRecord
  has_many :positions, dependent: :destroy

  validates_presence_of :username
end
