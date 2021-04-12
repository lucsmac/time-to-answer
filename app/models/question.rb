class Question < ApplicationRecord
  belongs_to :subject
  has_many :answers
  accepts_nested_attributes :answers
end
