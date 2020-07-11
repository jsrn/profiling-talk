class Kennel
  def self.average_age
    Puppy.pluck(:age).sum / Puppy.count
  end
end
