class Skill < ApplicationRecord

  has_many :skill_students, dependent: :destroy
  has_many :students, through: :skill_students

end
