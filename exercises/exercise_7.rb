require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Employee
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_associated :stores
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 40, less_than: 200 }
end

class Store
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_have_apparel

  def must_have_apparel
    if mens_apparel = false || womens_apparel = false
      errors.add("must carry mens or womens apparel")
    end
  end

end


