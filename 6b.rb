chars = File.read('input/6.txt').chomp.split('')
s = chars[0..13]
chars.each_with_index do |c, i|
  next if i < 14

  if s.uniq == s
    puts i
    break
  end
  s.delete_at(0)
  s << (c)
end
