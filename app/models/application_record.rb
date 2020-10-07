class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  filter_by :gender

  validates :name, :gender, :mobile_number, presence: true
  validates :mobile_number, length: { is: 9 }
end
