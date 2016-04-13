class Student < ApplicationRecord

  has_many :skill_students, dependent: :destroy
  has_many :skills, through: :skill_students
  has_many :cvs, dependent: :destroy


  def construct_skills
    cvs.each do |cv|
      Skill.all.each do |skill|
        puts skill.name if cv.content.match(/[\s\.\#]+#{skill.name}[\s\.]+/)
      end
    end

  end

end
