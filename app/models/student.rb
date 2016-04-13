class Student < ApplicationRecord

  has_many :skill_students, dependent: :destroy
  has_many :skills, through: :skill_students
  has_many :cvs

end