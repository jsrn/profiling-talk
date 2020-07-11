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
    combobulate
    discombobulate
  end

  def reticulate_splines
    rand(500_000..1_000_000).times do
      Math.sqrt(rand(1_000_000))
    end
  end

  def combobulate
    rand(500_000..1_000_000).times do
      Math.sqrt(rand(1_000_000))
    end
  end

  def discombobulate
    rand(1_000..5_000).times do
      if Math.sqrt(rand(1_000_000)).to_i.even?
        even_combobulation
      else
        odd_combobulation
      end
    end
  end

  def even_combobulation
    'create an object!'
  end

  def odd_combobulation
    1_000.times { 'create 10k objects!' }
  end
end
