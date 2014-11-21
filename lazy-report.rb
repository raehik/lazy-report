#!/usr/bin/env ruby
#
# Generate a report summary for a student.
#

class Report
  attr_reader :name

  def initialize(name, gender)
    @name = name
    set_pronouns(gender)

    # put this where?!
    path_parts="parts"
    path_sentences="sentences"

    # simple 'building blocks' for a sentence
    @adj_good = IO.readlines("#{path_parts}/adj-good")
    @adj_bad = IO.readlines("#{path_parts}/adj-bad")

    # fully constructed sentences
    @improvements = parse("#{path_sentences}/improvements")
    @goods = parse("#{path_sentences}/sentences_good")
    @bads = parse("#{path_sentences}/sentences_bad")
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

  def parse(file)
    arr = Array.new
    File.open(file).each do |line|
      arr << line.gsub("%NAME%", @name).gsub("%PRONOUN_S%", pronoun("s")).gsub("%PRONOUN_O%", pronoun("o")).gsub("%PRONOUN_G%", pronoun("g"))
    end
    return arr
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

  def improvements
    @improvements.sample
  end
end

report = Report.new("Raehik", "m")
puts report.pronoun("s")
puts report.adj_good
puts report.improvements
