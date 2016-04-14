class Language < ApplicationRecord

  has_many :language_students, dependent: :destroy
  has_many :students, through: :language_students

  has_many :children, class_name: 'Language', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Language'

end
