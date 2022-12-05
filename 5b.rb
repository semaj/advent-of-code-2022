stack_txt, moves_lines = File.read('input/5.txt').split("\n\n")
lines = stack_txt.split("\n")
indices = {}
lines.last.split('').each_with_index do |char, i|
  indices[i] = char.to_i if char != ' '
end
stacks = {}
indices.each do |_, v|
  stacks[v] = []
end
lines[0..-2].reverse.each do |line|
  line.split('').each_with_index do |char, i|
    next unless indices.include?(i)
    next if char == ' '

    stacks[indices[i]] << char
  end
end
moves = moves_lines.split("\n")
moves.map! do |move|
  amount, from, to = move.split(/move|from|to/).drop(1).map(&:to_i)
  stacks[to].push(*stacks[from].pop(amount))
end
stacks.each do |_, v|
  print v.last.to_s
end
puts ''
