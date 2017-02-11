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
      when match[:home][:name]
        goals += match[:home][:goals]
      when match[:away][:name]
        goals += match[:away][:goals]
      end
    end
    goals
  end

  def get_points(team_name)
    # win - 3 points; draw - 1; lose - 0
    points = 0
    matches_parsed.each do |match|
      case team_name
      when match[:home][:name]
        if match[:home][:goals] > match[:away][:goals]
          points += 3
        elsif match[:home][:goals] == match[:away][:goals]
          points += 1
        end
      when match[:away][:name]
        if match[:away][:goals] > match[:home][:goals]
          points += 3
        elsif match[:away][:goals] == match[:home][:goals]
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
      when match[:home][:name]
        goals_against += match[:away][:goals]
      when match[:away][:name]
        goals_against += match[:home][:goals]
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
      when match[:home][:name]
        goal_difference += match[:home][:goals] - match[:away][:goals]
      when match[:away][:name]
        goal_difference += match[:away][:goals] - match[:home][:goals]
      end
    end
    goal_difference
  end

  def get_wins(team_name)
    # Return the no. of wins a team has, 0 by default
    wins = 0
    matches_parsed.each do |match|
      case team_name
      when match[:home][:name]
        wins += 1 if match[:home][:goals] > match[:away][:goals]
      when match[:away][:name]
        wins += 1 if match[:home][:goals] < match[:away][:goals]
      end
    end
    wins
  end

  def get_draws(team_name)
    # Return the no. of draws a team has, 0 by default
    draws = 0
    matches_parsed.each do |match|
      case team_name
      when match[:home][:name]
        draws += 1 if match[:home][:goals] == match[:away][:goals]
      when match[:away][:name]
        draws += 1 if match[:home][:goals] == match[:away][:goals]
      end
    end
    draws
  end

  def get_losses(team_name)
    # Return the no. of losses a team has, 0 by default
    losses = 0
    matches_parsed.each do |match|
      case team_name
      when match[:home][:name]
        losses += 1 if match[:home][:goals] < match[:away][:goals]
      when match[:away][:name]
        losses += 1 if match[:home][:goals] > match[:away][:goals]
      end
    end
    losses
  end

  def matches_parsed
    @matches.map { |match_raw| LeagueTable.parse_match(match_raw) }
  end

  def self.parse_match(match)
    {
      home: {
        name: /\A(.+)\s\d+\s-/.match(match)[1],
        goals: /\s(\d+)\s-/.match(match)[1].to_i
      },
      away: {
        name: /-\s\d+\s(.+)\z/.match(match)[1],
        goals: /-\s(\d+)\s/.match(match)[1].to_i
      }
    }
  end
end
