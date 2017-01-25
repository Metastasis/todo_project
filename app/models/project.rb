class Project < ApplicationRecord
  has_many :todos
  accepts_nested_attributes_for :todos, :allow_destroy => true
  validates :title, presence: true
end
