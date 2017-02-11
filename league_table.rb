# :nodoc
class LeagueTable
  attr_reader :matches

  def initialize
    @matches = []
  end

  def get_goals_for(team_name)
    goals = 0
    @matches.each do |match_raw|
      match = LeagueTable.parse_match(match_raw)
      if team_name == match[:team_left_name]
        goals += match[:team_left_goals]
      elsif team_name == match[:team_right_name]
        goals += match[:team_right_goals]
      end
    end
    goals
  end

  def get_points(team_name)

  end

  def get_goals_against(team_name)
    # Returns the no. of goals a team has conceeded (had scored against them),
    # 0 by default
  end

  def get_goal_difference(team_name)
    # Return the no. of goals a team has scored
    # minus the no. of goals a team has conceeded, 0 by default
  end

  def get_wins(team_name)
    # Return the no. of wins a team has, 0 by default
  end

  def get_draws(team_name)
    # Return the no. of draws a team has, 0 by default
  end

  def get_losses(team_name)
    # Return the no. of losses a team has, 0 by default
  end

  def self.parse_match(match)
    {
      team_left_name:   /\A(.+)\s\d+\s-/.match(match)[1],
      team_left_goals:  /\s(\d+)\s-/.match(match)[1].to_i,
      team_right_name:  /-\s\d+\s(.+)\z/.match(match)[1],
      team_right_goals: /-\s(\d+)\s/.match(match)[1].to_i
    }
  end
end
