class Cvparser

  def initialize
    @file_list = []
    Dir.glob('./lib/cvparser/data/*.pdf').each do |f|
      @file_list << f
    end
  end

  def parse
    @file_list.each do |f|
      binding.pry
      split = f.split('/').last.split('_')
      return if Student.find_by(full_name: split[0..1].join(' '), school: split[2])
      student = Student.create(
        full_name: split[0..1].join(' '),
        school: split[2]
      )

      Yomu.read(:text, File.read(f))

    end
  end

end
