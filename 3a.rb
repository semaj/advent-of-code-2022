require 'set'
rows = File.read('input/3.txt').split("\n").map do |l|
  l.split('').each_slice((l.size / 2.0).round).to_a
end
priorities = rows.map do |first, second|
  x = first.to_set.intersection(second.to_set).first
  priority = x.ord - 96
  priority = x.ord - 65 + 27 if x == x.upcase
  priority
end
puts priorities.reduce(:+)
