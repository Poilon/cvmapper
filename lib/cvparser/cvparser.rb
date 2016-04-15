# coding: utf-8
class Cvparser

  def initialize
    @file_list     = Dir.glob('./lib/cvparser/data/*.pdf')
    @what_language = WhatLanguage.new(:all)
  end

  def run
    @file_list.each { |f| parse_cv(f) }
  end

  def parse_cv(f)
    begin
      pdf = PDF::Reader.new(f)
    rescue
      return
    end

    puts f
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

    return unless Cv.find_by(cv_infos).nil?

    content  = pdf.pages.map(&:text).join(' ').gsub('’', "'")
    language = @what_language.language(content)
    content  = I18n.transliterate(content).downcase.
               gsub(/[\?\!\,\;\:\{\}\[\]\-\_\/\|\<\>\(\)\"]+/, ' ').
               squish

    Cv.create(cv_infos.merge(content: content, language: language))
  rescue Exception => e
    return
  end

end
