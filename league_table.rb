# :nodoc
class LeagueTable
  attr_reader :matches

  def initialize
    @matches = []
  end

  def get_goals_for(team_name)
    # Returns the no. of goals a team has scored, 0 by default
    goals = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        goals += match[:left][:goals]
      when match[:right][:name]
        goals += match[:right][:goals]
      end
    end
    goals
  end

  def get_points(team_name)
    # win - 3 points; draw - 1; lose - 0
    points = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        if match[:left][:goals] > match[:right][:goals]
          points += 3
        elsif match[:left][:goals] == match[:right][:goals]
          points += 1
        end
      when match[:right][:name]
        if match[:right][:goals] > match[:left][:goals]
          points += 3
        elsif match[:right][:goals] == match[:left][:goals]
          points += 1
        end
      end
    end
    points
  end

  def get_goals_against(team_name)
    # Returns the no. of goals a team has conceeded (had scored against them),
    # 0 by default
    goals_against = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        goals_against += match[:right][:goals]
      when match[:right][:name]
        goals_against += match[:left][:goals]
      end
    end
    goals_against
  end

  def get_goal_difference(team_name)
    # Return the no. of goals a team has scored
    # minus the no. of goals a team has conceeded, 0 by default
    goal_difference = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        goal_difference += match[:left][:goals] - match[:right][:goals]
      when match[:right][:name]
        goal_difference += match[:right][:goals] - match[:left][:goals]
      end
    end
    goal_difference
  end

  def get_wins(team_name)
    # Return the no. of wins a team has, 0 by default
    wins = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        wins += 1 if match[:left][:goals] > match[:right][:goals]
      when match[:right][:name]
        wins += 1 if match[:left][:goals] < match[:right][:goals]
      end
    end
    wins
  end

  def get_draws(team_name)
    # Return the no. of draws a team has, 0 by default
    draws = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        draws += 1 if match[:left][:goals] == match[:right][:goals]
      when match[:right][:name]
        draws += 1 if match[:left][:goals] == match[:right][:goals]
      end
    end
    draws
  end

  def get_losses(team_name)
    # Return the no. of losses a team has, 0 by default
    losses = 0
    matches_parsed.each do |match|
      case team_name
      when match[:left][:name]
        losses += 1 if match[:left][:goals] < match[:right][:goals]
      when match[:right][:name]
        losses += 1 if match[:left][:goals] > match[:right][:goals]
      end
    end
    losses
  end

  def matches_parsed
    @matches.map { |match_raw| LeagueTable.parse_match(match_raw) }
  end

  def self.parse_match(match)
    {
      left: {
        name: /\A(.+)\s\d+\s-/.match(match)[1],
        goals: /\s(\d+)\s-/.match(match)[1].to_i
      },
      right: {
        name: /-\s\d+\s(.+)\z/.match(match)[1],
        goals: /-\s(\d+)\s/.match(match)[1].to_i
      }
    }
  end
end
