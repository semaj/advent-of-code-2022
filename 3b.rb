require 'set'
priorities = File.read('input/3.txt').split("\n").each_slice(3).map do |group|
  x = group.map { |x| x.split('').to_set }.reduce(:intersection).first
  priority = x.ord - 96
  priority = x.ord - 65 + 27 if x == x.upcase
  priority
end
puts priorities.reduce(:+)
