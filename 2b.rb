score = 0
File.read('input/2.txt').split("\n").map { |x| x.split(' ') }.each do |opp, rec|
  case rec
  when 'X'
    score += 0
    case opp
    when 'A'
      score += 3
    when 'B'
      score += 1
    when 'C'
      score += 2
    end
  when 'Y'
    score += 3
    case opp
    when 'A'
      score += 1
    when 'B'
      score += 2
    when 'C'
      score += 3
    end
  when 'Z'
    score += 6
    case opp
    when 'A'
      score += 2
    when 'B'
      score += 3
    when 'C'
      score += 1
    end
  end
end
puts score
