#!/usr/bin/env ruby
#
# Generate a random report for a student.
#

class Report
  @test = 1
  attr_reader :name

  def initialize(name, gender)
    @name = name
    set_pronouns(gender)

    @adj_good = IO.readlines("adj-good")
    @adj_bad = IO.readlines("adj-bad")

    @improvement = ["be more active in lessons", "hand in work on time", "put more effort into the lesson", "tryharder"]

    @sentence_good = ["#{@name} participates actively in the lesson", "#{@name} is always very active in lessons"]
    @sentence_bad = ["#{pronoun("s")} has on occasion been quite rude", "#{pronoun("s")} does have a tendency to arrive late to lessons -- this must be fixed, please!!"]

    @sentence_improvement = [ "#{@name} should try to #{improvement}", "#{pronoun("s")} needs to #{improvement}"]
  end

  def set_pronouns(gender)
    if gender == "m"
      @pronoun_s = "he"
      @pronoun_o = "him"
      @pronoun_g = "his"
    elsif gender == "f"
      @pronoun_s = "she"
      @pronoun_o = "her"
      @pronoun_g = "her"
    end
  end

  def pronoun(declension)
    roll = rand(2)
    if roll == 1
      @name
    else
      if declension == "s"
        @pronoun_s
      elsif declension == "o"
        @pronoun_o
      elsif declension == "g"
        @pronoun_g
      end
    end
  end

  def adj_good
    @adj_good.sample
  end

  def sentence_good
    @sentence_good.sample
  end

  def sentence_bad
    @sentence_bad.sample
  end

  def improvement
    @improvement.sample
  end

  def sentence_improvement
    @sentence_improvement.sample
  end
end

report = Report.new("Raehik", "m")
puts report.pronoun("s")
puts report.adj_good
puts report.sentence_good
puts report.sentence_bad
puts report.sentence_improvement
