class Cvparser

  def initialize
    @file_list = Dir.glob('./lib/cvparser/data/*.pdf')
  end

  def run
    @file_list.each do |f|
      parse_cv(f)
    end
  end

  def parse_cv(f)
    split = f.split('/').last.split('.').first.split('_')

    student_infos = {
      full_name: split[0..1].join(' '),
      school: split[2]
    }
    student  = Student.find_by(student_infos) || Student.create(student_infos)
    cv_infos = {
      student_id:  student.id,
      uploaded_at: DateTime.parse(split[-1])
    }

    return if Cv.find_by(cv_infos)

    Cv.create(
      cv_infos.merge(
        content: I18n.transliterate(
          Yomu.read(:text, File.read(f)).gsub('’', "'")
        ).downcase.gsub(/[\?\!\,\;\:\{\}\[\]\-\_\/\|\<\>\(\)\"]+/, ' ').squish
      )
    )
  end

end
