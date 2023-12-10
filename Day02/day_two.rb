module Day02
  COLOR_MAX = {
    'r' => 12,
    'g' => 13,
    'b' => 14
  }
  total = 0

  def id_finder(line)
    game = line.split(":")
    id = game[0].scan(/\d+/)[0].to_i
  end

  def handful_finder(line)
    game = line.split(":")
    handfuls = game[1].split(";")
  end

  def main()
    IO.foreach("input_day_2.txt") do |line|
      possible = true
      id = id_finder(line)
      handfuls = handful_finder(line)
      each_color = []
      handfuls.each do |handful| 
        each_color << handful.split(",")
      end
      each_color.each do |chunk|
        chunk = chunk[0].scan(/\d+ ./)
        number = chunk[0].scan(/\d+/)
        key = chunk[0].scan(/[a-z]/)
        if COLOR_MAX[key[0]] < number[0].to_i
          possible = false 
        end
    end
      if possible == true
        total+=id
      else
        puts id
      end
    end
    puts total
  end
end
