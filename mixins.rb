module ExtraJellyMethods
  def swim_faster
    if self.is_peaceful
      3.times do
        puts "swims peacefully"
        sleep(0.1)
      end
    else
      3.times do
        puts "swims angrily"
        sleep(0.1)
      end
    end
  end

  def swim_slower
    if self.is_peaceful
      3.times do
        puts "swims peacefully"
        sleep(1)
      end
    else
      3.times do
        puts "swims angrily"
        sleep(0.8)
      end
    end
  end

  def sink_to_bottom
    puts "sinking..."
    sleep(0.3)
    puts "sinking..."
    sleep(0.3)
    puts "sank!"
  end
end
