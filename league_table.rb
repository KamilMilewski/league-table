# :nodoc
class LeagueTable
  def get_points(team_name)
    # Returns the no. of points a team has, 0 by default
  end

  def get_goals_for(team_name)
    # Returns the no. of goals a team has scored, 0 by default
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
end
