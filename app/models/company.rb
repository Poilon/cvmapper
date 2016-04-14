class Company < ApplicationRecord

  has_many :company_students, dependent: :destroy
  has_many :students, through: :company_students

  has_many :children, class_name: 'Company', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Company'

end
