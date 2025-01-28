require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  <<-HTML
  <style>
    .navigation_container {
      display: flex;
      justify-content: space-evenly;
    }
    </style>
    <div class="navigation_container">
      <a href=\"/\">Home</a> 
      <a href=\"/dice/2/6\">2d6</a>
      <a href=\"/dice/2/10\">2d10</a>
      <a href=\"/dice/1/20\">1d20</a>
      <a href=\"/dice/5/4\">5d4</a></p>
    </div>
  
  <h1>Dice Roll</h1>
  <p><a href=\"/dice/2/6\">* Roll two 6-sided dice</a></p>
  <p><a href=\"/dice/2/10\">* Roll two 10-sided dice</a></p>
  <p><a href=\"/dice/1/20\">* Roll one 20-sided die</a></p>
  <p><a href=\"/dice/5/4\">* Roll five 4-sided dice</a></p>
  HTML

end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get("/dice/2/10") do

  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"

end

get("/dice/1/20") do

  first_die = rand(1..20)
  sum = first_die

  outcome = "You rolled a #{first_die} for a total of #{sum}."
  
  "<h1>1d20</h1>
  <p>#{outcome}</p>"

end

get("/dice/5/4") do

  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die} for a total of #{sum}."
  
  "<h1>5d4</h1>
  <p>#{outcome}</p>"

end
