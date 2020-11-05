
#yield to a block passing in current study number
#block should return efectiveness of study session
#use effectiveness

def simulate_studying
  study_session = 0
  total_effectiveness = 0
  until total_effectiveness > 100
    study_session += 1
    puts "Study session number: #{study_session}"
    effectiveness = yield(study_session)
    total_effectiveness += effectiveness
    puts "It was #{effectiveness < 10 ? "somewhat" : "very"} effective!"
  end
  puts "Studying over!"
end

def main
  #spelling
  simulate_studying do |session|
    word_list = ["result", "experience", "phonetic", "hippocampus"]
    rand(4) * word_list.length
  end

  #maths
  simulate_studying do |session|
    questions = {
      "2+2" => 4,
      "7+3" => 10,
      "9+18" => 27,
      "1255656 + 786786" => 2042442
    }
    answers = {
      "2+2" => 5,
      "7+3" => 10,
      "9+18" => 29,
      "1255656 + 786786" => 2042442
    }
    correct_answers = 0
    questions.keys.each {|key|  correct_answers += 1 if questions[key] == answers[key]}
    puts correct_answers
    5 * correct_answers
  end

end


main
