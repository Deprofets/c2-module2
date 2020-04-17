# frozen_string_literal: true

require 'test/unit/assertions'

include Test::Unit::Assertions

class HighScoreTable
  attr_accessor :scores
  attr_reader :size_limit

  def initialize(size_limit)
    @size_limit = size_limit
    @scores = []
  end

  def update(new_score)
    scores << new_score
    @scores = scores.max(size_limit)
  end

  def reset
    scores.clear
  end
end

high_scores = HighScoreTable.new(3)

assert_equal(high_scores.scores, [])

high_scores.update(10)
assert_equal(high_scores.scores, [10])

high_scores.update(8)
high_scores.update(12)
assert_equal(high_scores.scores, [12, 10, 8])

high_scores.update(5)
assert_equal(high_scores.scores, [12, 10, 8])

high_scores.update(10)
assert_equal(high_scores.scores, [12, 10, 10])

high_scores.update(10)
assert_equal(high_scores.scores, [12, 10, 10])

high_scores.update(20)
assert_equal(high_scores.scores, [20, 12, 10])

high_scores.update(20)
assert_equal(high_scores.scores, [20, 20, 12])

high_scores.update(20)
assert_equal(high_scores.scores, [20, 20, 20])

high_scores.reset
assert_equal(high_scores.scores, [])
