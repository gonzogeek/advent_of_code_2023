module Day02

  COLOR_MAX = {
    "r" => 12,
    "g" => 13,
    "b" => 14
  }


  def part1(file)
    total = 0
    IO.foreach(file) do |line|
      possible = true
      game = line.split(":")
      id = game[0].scan(/\d+/)[0].to_i
      handfuls = game[1].split(";")
      each_color = []
      handfuls.each do |handful| 
        # puts handful.split(",")
        each_color << handful.split(",")
      end
      each_color.flatten!
      each_color.each do |chunk|
        # puts "this is chunk: #{chunk}"
        chunk = chunk.scan(/\d+ ./)[0]
        number = chunk.scan(/\d+/)
        key = chunk.scan(/[a-z]/)
        # puts "key is #{key} and number is #{number}"
        
        if COLOR_MAX[key[0]] < number[0].to_i
          possible = false 
        end
      end
      if possible == true
        # puts "total is #{total}"
        total = total + id
      end
    end
    print total
    return total
  end

  def part2(file)
    total = 0
    IO.foreach(file) do |line|
      line_total = 0
      color_min = {
        'r' => 0,
        'g' => 0,
        'b' => 0
      }
      possible = true
      game = line.split(":")
      id = game[0].scan(/\d+/)[0].to_i
      handfuls = game[1].split(";")
      each_color = []
      handfuls.each do |handful| 
        # puts handful.split(",")
        each_color << handful.split(",")
      end
      each_color.flatten!
      each_color.each do |chunk|
        # puts "this is chunk: #{chunk}"
        chunk = chunk.scan(/\d+ ./)[0]
        number = chunk.scan(/\d+/)
        key = chunk.scan(/[a-z]/)
        # puts "key is #{key} and number is #{number}"
        
        if color_min[key[0]] < number[0].to_i
          color_min[key[0]] = number[0].to_i
        end
      end
      line_total = color_min['r'] * color_min['g'] * color_min['b']
      total += line_total
    end
    print total
    return total
  end
end
