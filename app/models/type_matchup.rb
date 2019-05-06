class TypeMatchup < ApplicationRecord
  validates :source, uniqueness: { scope: :target }
end
