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
    if do_update_username = "Y"
      puts "Type your new username: "
      @username = gets.chomp
    end
    
    puts "Change password? (Y/N) "
    do_update_password = gets.chomp
    if do_update_password = "Y"
      puts "Type your new password: "
      @password = gets.chomp
    end
    
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
    
    if type == "zombie || type == "survivor"
      type_bool = true
    else
      type_bool = false
    end
    
    if type_bool = true
      player = User.new(usename,pass,type,email,charname)
      user_created = true
    end
  end
end

create_user
      
      
    
  
  
