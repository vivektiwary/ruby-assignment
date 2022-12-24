class Person < ApplicationRecord
  validates :name, presence: true
  belongs_to :lives_at, class_name: 'Address', foreign_key: 'address_id'
  has_many :vehicles
  has_many :drives
end

class Student < Person
  validates :student_number, presence: true
end

class Professor < Person
  validates :salary, presence: true
end

class Address < ApplicationRecord
  validates :street, :city, :country, presence: true
end

class Drive < ApplicationRecord
  validates :date, :distance, presence: true
  belongs_to :person
  belongs_to :vehicle
end

class Vehicle < ApplicationRecord
  validates :model, :plate_number, presence: true
  belongs_to :person
end
