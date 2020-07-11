class Puppy < ApplicationRecord
  scope :microchipped, -> { where(microchipped: true) }

  def pet
    "U'.'U"
  end

  def ear_inside_out?
    @ear ||= ['(', '(', '(', ')'].sample
    @ear == ')'
  end

  def fix_ear
    @ear = '{'
  end
end
