class CompanyStudent < ApplicationRecord

  belongs_to :student
  belongs_to :company

end
