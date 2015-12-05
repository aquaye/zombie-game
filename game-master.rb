# model - declare classes
# in future: declare classes => pull data from database

class User
  

  def initialize(username,password,user_type,email_address,char_name)
    @username = username
    @email_address = email_address
    @password = password
    @user_type = user_type
    @char_name = char_name
  end
  
  def update_user
    puts "Change username? (Y/N) "
    do_update_username = gets.chomp
    if do_update_username == "Y"
      puts "Type your new username: "
      @username = gets.chomp
    end
    
    puts "Change password? (Y/N) "
    do_update_password = gets.chomp
    if do_update_password == "Y"
      puts "Type your new password: "
      @password = gets.chomp
    end
    
  end
    
end

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
  
  def return_h_pos
    return @h_pos
  end
  
  def return_v_pos
    return @v_pos
  end
    
  def return_v_width
    return @v_width
  end

  def return_h_height
    return @h_height
  end
end

# controller

def create_user
  user_created = false
  while user_created == false
    puts "Enter your username: "
    usename = gets.chomp.to_s
    
    puts "Enter your email address: "
    email = gets.chomp.to_s
    
    puts "Enter your password: "
    pass = gets.chomp.to_s
    
    puts "Enter your character name: "
    charname = gets.chomp.to_s
    
    puts "Enter your character type: (zombie/survivor) "
    type = gets.chomp.to_s
    
    if type == "zombie" || type == "survivor"
      return User.new(usename,pass,type,email,charname)
      user_created = true
    end
  end
end

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

def menu
  while true
    puts "1. move
2. user menu
3. exit"
    action = gets.chomp
    
    case action
    when "move"
      movement_options = []

      h_pos = $map.return_h_pos
      v_pos = $map.return_v_pos

      puts "#{h_pos}, #{v_pos}"

      puts "Select a direction: "
      
      if h_pos > 1
        puts "Move WEST"
        movement_options.push("WEST")
      end
      if h_pos < $map.return_h_height
        puts "Move EAST"
        movement_options.push("EAST")
      end
      if v_pos > 1
        puts "Move SOUTH"
        movement_options.push("SOUTH")
      end
      if v_pos < $map.return_v_width
        puts "Move NORTH"
        movement_options.push("NORTH")
      end
      
      move_dir = gets.chomp.to_s

      can_move = false

      # loop that checks movement_options and changes can_move to true if move_dir matches a value in movement_options


      
      if move_dir == "NORTH" 
        $map.move_north
      elsif move_dir == "SOUTH" 
        $map.move_south
      elsif move_dir == "EAST" 
        $map.move_east
      elsif move_dir == "WEST"
        $map.move_west
      end
    when "user menu"
      user.update_user
    when "exit"
      break
    end
  end
end

$player = create_user

$map = create_map

menu.call

# tests

#niikwei = create_user


      
      
    
  
