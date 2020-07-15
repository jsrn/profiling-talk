class Kennel
  def average_age
    Puppy.pluck(:age).sum / Puppy.count
  end

  def percentage_chipped
    (Puppy.microchipped.count.to_f / Puppy.count) * 100
  end

  def validate_puppies!
    raise StandardError.new, 'Impossible dog located!' if Puppy.pluck(:age).any? { |age| age > 100 }
  end

  def perform_ear_spot_check
    spot_check_batch.each do |puppy|
      puppy.fix_ear if puppy.ear_inside_out?
    end

    true
  end

  private

  def spot_check_batch
    limit = Puppy.count / 10
    Puppy.all.sample(limit)
  end
end
