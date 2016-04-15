class Student < ApplicationRecord

  has_many :skill_students, dependent: :destroy
  has_many :skills, through: :skill_students

  has_many :language_students, dependent: :destroy
  has_many :languages, through: :language_students

  has_many :company_students, dependent: :destroy
  has_many :companies, through: :company_students

  has_many :cvs, dependent: :destroy


  def self.construct_all
    skills_array    = Skill.all.map(&:name)
    langs_array     = Language.all.map(&:name)
    companies_array = Company.all.map(&:name)

    all.each do |e|
      e.construct_all(
        {
          Skill:    skills_array,
          Language: langs_array,
          Company:  companies_array
        }
      )
    end
  end

  def construct_all(arrays)
    cvs.each do |cv|
      puts full_name
      arrays.each do |klass, array|
        klass = klass.to_s
        add_cv_language if klass == 'Language'
        array.each do |e|
          next unless cv.content.match(/[\s\.\#]+#{e.gsub('(', '\(').gsub(')', '\)')}[\s\.]+/)
          record = klass.constantize.find_by(name: e)
          truerecord = (record.parent || record)
          next if eval("#{klass.downcase.pluralize}.include?(truerecord)")
          eval("#{klass.downcase.pluralize} << truerecord")
        end
      end
    end
    save
  end

  def add_cv_language
    lang = Language.find_by(name: cvs.last.language)
    return if lang.nil?
    truelang = (lang.parent || lang)
    languages << truelang unless languages.include?(truelang)
  end

end
