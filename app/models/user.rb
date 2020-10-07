class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # TODO validation
  has_one_attached :upload
  validates :upload, presence: true

  self.per_page = 5

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
