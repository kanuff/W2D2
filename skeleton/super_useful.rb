# PHASE 2
def convert_to_int(str) 
  begin
    Integer(str)
  rescue StandardError
    puts "can't convert string into integer"
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise Coffee_error
  else 
    raise StandardError 
  end 
end

class Coffee_error < StandardError
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue Coffee_error
    puts "Got coffee guess again"
    retry
  rescue StandardError
    puts "can't eat that"
  end 
end  

class NotBestiesError < StandardError
end
class NoName < StandardError
end
class NoHobby < StandardError
end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.empty?
      raise NoName
    else
      @name = name
    end

    if yrs_known >= 5
      @yrs_known = yrs_known
    else
      raise NotBestiesError
    end
    
    if fav_pastime.empty?
      raise NoHobby
    else
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


