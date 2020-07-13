class Puppy < ApplicationRecord
  scope :microchipped, -> { where(microchipped: true) }

  def ear_inside_out?
    @ear ||= ['(', '(', '(', ')'].sample
    @ear == ')'
  end

  def fix_ear
    @ear = '{'
  end
end
