require 'benchmark'
require 'ruby-prof'

class PuppiesController < ApplicationController
  def index
    render layout: nil
  end

  def the_puts_classic
    start = Time.zone.now
    puppies!
    puts "⏱  completed in #{(Time.zone.now - start).in_milliseconds} milliseconds"
  end

  def benchmark
    Benchmark.bm(10) do |bm|
      bm.report('puppies:') { puppies! }
    end
  end

  def ruby_prof
    RubyProf.start

    puppies!

    result = RubyProf.stop

    printer = RubyProf::MultiPrinter.new(result)
    printer.print(path: 'public/reports', profile: 'ruby_prof')
  end

  def rack_mini_profiler
    puppies!
  end

  private

  def puppies!
    reticulate_splines

    kennel = Kennel.new
    kennel.validate_puppies!

    @report = OpenStruct.new(
      count: Puppy.count,
      average_age: kennel.average_age,
      percentage_chipped: kennel.percentage_chipped,
      ears_spot_checked: kennel.perform_ear_spot_check
    )
  end

  def reticulate_splines
    Puppy.count.times do
      Math.sqrt(rand(1_000_000))
    end
  end
end
