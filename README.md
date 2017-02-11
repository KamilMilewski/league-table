# Welcome to LeagueTable

## What is LeagueTable

The LeagueTable class is used to store results of football (soccer) matches played, as well as return and display various stats about each team.

The LeagueTable class requires an array of strings called matches which stores the results of matches played.

LeagueTable expects results to always be passed as a String in the format:
```
"Home Team 0 - 0 Away Team"
```
for example:
```
"Man Utd 3 - 0 Liverpool".
```

## The class has following methods
```
get_points(team_name) # Returns the no. of points a team has, 0 by default
get_goals_for(team_name) # Returns the no. of goals a team has scored, 0 by default
get_goals_against(team_name) # Returns the no. of goals a team has conceeded (had scored against them), 0 by default
get_goal_difference(team_name) # Return the no. of goals a team has scored minus the no. of goals a team has conceeded, 0 by default
get_wins(team_name) # Return the no. of wins a team has, 0 by default
get_draws(team_name) # Return the no. of draws a team has, 0 by default
get_losses(team_name) # Return the no. of losses a team has, 0 by default
```

## Example of use
```
lt = LeagueTable.new

lt.matches.push("Man Utd 3 - 0 Liverpool")

puts lt.get_goals_for("Man Utd") => 3
puts lt.get_points("Man Utd") => 3
puts lt.get_points("Liverpool") => 0
puts lt.get_goal_difference("Liverpool") => -3

lt.matches.push("Liverpool 1 - 1 Man Utd")

puts lt.get_goals_for("Man Utd") => 4
puts lt.get_points("Man Utd") => 4
puts lt.get_points("Liverpool") => 1
puts lt.get_goals_against("Man Utd") => 1

puts lt.get_points("Tottenham") => 0
```
## Legal stuff

KMForum is available under an [MIT](http://www.opensource.org/licenses/MIT)-style license. Copyright © 2017 Kamil Milewski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
