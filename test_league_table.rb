require 'minitest/autorun'
# Tests for LeagueTable class
class TestLeagueTable < Minitest::Test
  def setup
    @lt = LeagueTable.new
    @lt.matches.push('Man Utd 3 - 0 Liverpool')
  end

  def test_that_can_get_goals
    assert_equal @lt.get_goals_for('Man Utd'), 3
  end

  def test_that_can_get_points
    assert_equal @lt.get_points('Man Utd'), 3
    assert_equal @lt.get_points('Liverpool'), 0
  end

  def test_that_can_get_goal_difference
    assert_equal @lt.get_goal_difference('Liverpool'), -3
  end
end
#
# lt = LeagueTable.new
#
# lt.matches.push("Man Utd 3 - 0 Liverpool")

# puts lt.get_goals_for("Man Utd") # => 3
# puts lt.get_points("Man Utd") # => 3
# puts lt.get_points("Liverpool") # => 0
# puts lt.get_goal_difference("Liverpool") # => -3
#
# lt.matches.push("Liverpool 1 - 1 Man Utd")
#
# puts lt.get_goals_for("Man Utd") # => 4
# puts lt.get_points("Man Utd") # => 4
# puts lt.get_points("Liverpool") # => 1
# puts lt.get_goals_against("Man Utd") # => 1
#
# puts lt.get_points("Tottenham") # => 0
