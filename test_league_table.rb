require 'minitest/autorun'
# Tests for LeagueTable class
class TestLeagueTable < Minitest::Test
  def setup
    @lt = LeagueTable.new
    @lt.matches.push('Man Utd 3 - 0 Liverpool')
    @lt.matches.push('Liverpool 2 - 10 Man Utd')
    @lt.matches.push('Jagiellonia Białystok 3 - 1 Legia')
    @lt.matches.push('Barcelona 0 - 0 Liverpool')
    @lt.matches.push('Real Madryt 0 - 3 Jagiellonia Białystok')
    @lt.matches.push('Mońki 0 - 3 Sokółka')
  end

  def test_parse_match_method
    parsed_match = LeagueTable.parse_match('Man Utd 3 - 0 Liverpool')
    assert_equal 'Man Utd',   parsed_match[:left][:name]
    assert_equal 3,           parsed_match[:left][:goals]
    assert_equal 'Liverpool', parsed_match[:right][:name]
    assert_equal 0,           parsed_match[:right][:goals]
  end

  def test_that_can_get_goals
    assert_equal 13, @lt.get_goals_for('Man Utd')
    assert_equal 2,  @lt.get_goals_for('Liverpool')
    assert_equal 6,  @lt.get_goals_for('Jagiellonia Białystok')
    assert_equal 0,  @lt.get_goals_for('Barcelona')
    assert_equal 0,  @lt.get_goals_for('Real Madryt')
    assert_equal 1,  @lt.get_goals_for('Legia')
    assert_equal 0,  @lt.get_goals_for('Mońki')
    assert_equal 3,  @lt.get_goals_for('Sokółka')
  end

  def test_that_can_get_points
    # win - 3 points; draw - 1; lose - 0
    assert_equal 6, @lt.get_points('Man Utd')
    assert_equal 1, @lt.get_points('Liverpool')
    assert_equal 6, @lt.get_points('Jagiellonia Białystok')
    assert_equal 1, @lt.get_points('Barcelona')
    assert_equal 0, @lt.get_points('Real Madryt')
    assert_equal 0, @lt.get_points('Legia')
    assert_equal 0, @lt.get_points('Mońki')
    assert_equal 3, @lt.get_points('Sokółka')
  end

  def test_that_can_get_goal_difference
    assert_equal @lt.get_goal_difference('Man Utd'), 11
    assert_equal @lt.get_goal_difference('Liverpool'), -11
    assert_equal @lt.get_goal_difference('Jagiellonia Białystok'), 5
    assert_equal @lt.get_goal_difference('Barcelona'), 0
    assert_equal @lt.get_goal_difference('Real Madryt'), -3
    assert_equal @lt.get_goal_difference('Legia'), -2
    assert_equal @lt.get_goal_difference('Mońki'), -3
    assert_equal @lt.get_goal_difference('Sokółka'), 3
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
