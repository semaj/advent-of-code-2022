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

@sizes = {}
def size(path)
  total_size = 0
  @tree[path].each do |_, o|
    if o[:type] == 'dir'
      p = path + [o[:name]]
      o[:size] = size(p)
      @sizes[p] = o[:size]
    end
    total_size += o[:size]
  end
  total_size
end
total = size([''])
must_free = 30_000_000 - (70_000_000 - total)
min = must_free * 100
@sizes.each do |_, size|
  min = size if size >= must_free && size < min
end
puts min
