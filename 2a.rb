score = 0
File.read('input/2.txt').split("\n").map { |x| x.split(' ') }.each do |opp, rec|
  case rec
  when 'X'
    score += 1
    case opp
    when 'A'
      score += 3
    when 'B'
      score += 0
    when 'C'
      score += 6
    end
  when 'Y'
    score += 2
    case opp
    when 'A'
      score += 6
    when 'B'
      score += 3
    when 'C'
      score += 0
    end
  when 'Z'
    score += 3
    case opp
    when 'A'
      score += 0
    when 'B'
      score += 6
    when 'C'
      score += 3
    end
  end
end
puts score
