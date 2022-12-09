m = File.read('input/8.txt').split("\n").map { |x| x.split('').map(&:to_i) }
walk = 0 # Assume square
highest = Array.new(m.size) { Array.new(m.size) { {} } }
(0...m.size).each do |row|
  (0...m.size).each do |col|
    if col - 1 >= 0
      last = m[row][col - 1]
      last_highest = highest[row][col - 1][:left]
      high = [last_highest || 0, last].max
      highest[row][col][:left] = high
    else
      highest[row][col][:left] = nil
    end
  end
  (0...m.size).to_a.reverse.each do |col|
    if col + 1 < m.size
      last = m[row][col + 1]
      last_highest = highest[row][col + 1][:right]
      high = [last_highest || 0, last].max
      highest[row][col][:right] = high
    else
      highest[row][col][:right] = nil
    end
  end
end
(0...m.size).each do |col|
  (0...m.size).each do |row|
    if row - 1 >= 0
      last = m[row - 1][col]
      last_highest = highest[row - 1][col][:top]
      high = [last_highest || 0, last].max
      highest[row][col][:top] = high
    else
      highest[row][col][:top] = nil
    end
  end
  (0...m.size).to_a.reverse.each do |row|
    if row + 1 < m.size
      last = m[row + 1][col]
      last_highest = highest[row + 1][col][:bottom]
      high = [last_highest || 0, last].max
      highest[row][col][:bottom] = high
    else
      highest[row][col][:bottom] = nil
    end
  end
end

visible = 0
highest.each_with_index do |r, row|
  r.each_with_index do |h, col|
    %i[left right top bottom].each do |d|
      next unless h[d].nil? || h[d] < m[row][col]

      visible += 1
      break
    end
  end
end
puts visible
