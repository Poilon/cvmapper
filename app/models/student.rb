class Student < ApplicationRecord

  has_many :skill_students, dependent: :destroy
  has_many :skills, through: :skill_students
  has_many :cvs, dependent: :destroy


  def self.construct_skills
    skills_array = Skill.all.map(&:name)
    all.each { |e| e.construct_skills(skills_array)}
  end

  def construct_skills(skills_array)
    cvs.each do |cv|
      puts full_name
      skills_array.each do |sk|
        next unless cv.content.match(/[\s\.\#]+#{sk}[\s\.]+/)
        next if skills.map(&:name).include?(sk)
        dbskill = Skill.find_by(name: sk)
        skills << (dbskill.parent || dbskill)
        save
      end
    end

  end

end
