rows = File.read('input/4.txt').split("\n").map { |x| x.split(',') }
rows.map! do |row|
  row.map do |assignment|
    start, stop = assignment.split('-').map(&:to_i)
    (start..stop)
  end
end
overlaps = rows.select do |x, y|
  x.include?(y.first) ||
    x.include?(y.last) ||
    y.include?(x.first) ||
    y.include?(x.last)
end
puts overlaps.count
