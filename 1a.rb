puts File.read('input/1.txt').split("\n\n").map { |x| x.split("\n").map(&:to_i).reduce(:+) }.max
