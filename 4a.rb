rows = File.read('input/4.txt').split("\n").map { |x| x.split(',') }
rows.map! do |row|
  row.map do |assignment|
    start, stop = assignment.split('-').map(&:to_i)
    (start..stop)
  end
end
puts rows.select { |x, y| x.cover?(y) || y.cover?(x) }.count
