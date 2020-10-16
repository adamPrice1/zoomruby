
def main
  print "Player 1 selection? "
  input1 = gets.chomp.downcase
  until ["rock","paper","scissors"].include?(input1)
    puts "No cheaters! Only Rock, Paper or Scissors are allowed."
    puts "Player 1 selection? "
    input = gets.chomp.downcase
  end

  print "Player 2 selection? "
  input2 = gets.chomp.downcase
  until ["rock","paper","scissors"].include?(input2)
    puts "No cheaters! Only Rock, Paper or Scissors are allowed."
    puts "Player 2 selection? "
    input = gets.chomp.downcase
  end
  puts calculate_winner(input1,input2)
end

def calculate_winner(input1,input2)
  if input1 == input2 then return "Its a tie" end
  winner = ""
  case [input1, input2].sort
    when ["paper","rock"]
      winner += "paper covers rock"
      if input1 == "paper"
        winner += "\nplayer 1"
        $player1_wins += 1
      else
        winner += "\nplayer 2"
        $player2_wins += 1
      end
    when ["rock","scissors"]
      winner += "rock crushes scissors"
      if input1 == "rock"
        winner += "\nplayer 1"
        $player1_wins += 1
      else
        winner += "\nplayer 2"
        $player2_wins += 1
      end
    when ["paper","scissors"]
      winner += "scissors cuts paper"
      if input1 == "scissors"
         winner += "\nplayer 1"
         $player1_wins += 1
      else
        winner += "\nplayer 2"
        $player2_wins += 1
      end
  end
  winner
end

$player1_wins = 0
$player2_wins = 0

until [$player1_wins,$player2_wins].max == 2
  main
end

if $player1_wins == 2
  puts "Player 1 wins the best 2/3"
else
  puts "Player 2 wins the best 2/3"
end
