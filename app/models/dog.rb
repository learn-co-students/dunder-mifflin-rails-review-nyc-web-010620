class Dog < ApplicationRecord
    belongs_to :employee
    validates :breed, :age, uniqueness: true
end
