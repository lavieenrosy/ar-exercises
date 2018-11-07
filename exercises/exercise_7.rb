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
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_associated :store
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 40, less_than: 200 }
end

class Store
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_have_apparel

  def must_have_apparel
    if (mens_apparel = false || !mens_apparel.present?) || (womens_apparel = false || !womens_apparel.present?)
      errors.add(:mens_apparel, "must carry mens apparel")
      errors.add(:womens_apparel, "must carry womens apparel")
    end
  end

end

puts "Please input a store name:"
print "> "
store_name = $stdin.gets.chomp
new_store = Store.create(name: store_name)
p new_store.mens_apparel.present?
new_store.save

p new_store.errors.messages

puts "Please input an employee name:"
print "> "
employee_name = $stdin.gets.chomp
new_employee = Employee.create(first_name: employee_name)
new_employee.save

p new_employee.errors.messages
