class Skill < ApplicationRecord

  has_many :skill_students, dependent: :destroy
  has_many :students, through: :skill_students

  has_many :children, class_name: 'Skill', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Skill'

end
