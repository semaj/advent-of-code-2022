cmds_output = File.read('input/7.txt').split('$').drop(1).map do |x|
  x.split("\n", 2)
end

@tree = {
  [''] => {
    '/' => {
      type: 'dir',
      name: '/',
      size: 0
    }
  }
}
stack = []
current_dir = ''
cmds_output.each do |cmd, output|
  c, arg = cmd.split(' ')
  case c
  when 'cd'
    if arg == '..'
      current_dir = stack.pop
    else
      stack.push(current_dir)
      current_dir = arg
    end
  when 'ls'
    path = stack.clone + [current_dir]
    @tree[path] ||= {}
    output.split("\n").map { |x| x.split(' ') }.each do |x, name|
      @tree[path][name] =  {
        type: x == 'dir' ? x : 'file',
        name: name,
        size: x == 'dir' ? 0 : x.to_i
      }
    end
  end
end

@less_100000 = 0
def size(path)
  total_size = 0
  @tree[path].each do |_, o|
    if o[:type] == 'dir'
      o[:size] = size(path + [o[:name]])
      @less_100000 += o[:size] if o[:size] <= 100_000
    end
    total_size += o[:size]
  end
  total_size
end
size([''])
puts @less_100000
