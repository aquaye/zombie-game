# model

class Map
  def initialize(v,h)
    @v_width = v
    @h_height = h
    @v_pos = (v + 1) / 2 # assumes v is odd
    @h_pos = (h + 1) / 2 # assumes h is odd
  end
  
  def move_east
    @h_pos += 1
  end
  
  def move_west
    @h_pos -= 1
  end
  
  def move_north
    @v_pos += 1
  end
  
  def move_south
    @v_pos -= 1
  end
  
  def puts_pos
    puts "#{@h_pos}, #{@v_pos}"
  end
    
end

# controller

def create_map
  puts "How wide is the map? "
  h = gets.chomp.to_i
  
  puts "How tall is the map? "
  v = gets.chomp.to_i
  
  if h % 2 != 0 && v % 2 != 0
    return Map.new(h,v)
  end
end

# view





# tests

map = create_map
map.puts_pos
map.move_south
map.puts_pos
map.move_west
map.puts_pos
map.move_north
map.puts_pos
map.move_east
map.puts_pos
