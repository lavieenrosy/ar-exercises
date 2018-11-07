require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Harry", last_name: "Potter", hourly_rate: 20)
@store1.employees.create(first_name: "Hermione", last_name: "Granger", hourly_rate: 20)
@store1.employees.create(first_name: "Ron", last_name: "Weasley", hourly_rate: 20)
@store2.employees.create(first_name: "Daenarys", last_name: "Stormborn", hourly_rate: 30)
@store2.employees.create(first_name: "Jon", last_name: "Snow", hourly_rate: 30)

pp @store2.employees