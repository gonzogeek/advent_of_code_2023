module Day03
  # wrong answer, too high: 510483, 513301, 513274
  # wrong answer: 510456
  # right answer: 509115
  # no double-additions ✅
  # numbers match
  
  def part1(file)

    s = File.new(file).readlines(chomp: true).map { |l| ".#{l}." }

    n = s.length
    s.prepend '.' * (n + 2)
    s.append  '.' * (n + 2)

    ans = 1.upto(n).sum do |i|
      s[i].gsub(/\d+/).sum do |num|
        a, b = Regexp.last_match.offset(0)
        a -= 1

        regex = /^[.\d]*$/
        exclude = s[i][a] == '.' && s[i][b] == '.'
        exclude &= s[i - 1][a..b].match? regex
        exclude &= s[i + 1][a..b].match? regex
        exclude ? 0 : num.to_i
      end
    end

    puts ans
    ans
  end

  def part2(file)
    s = File.new(file).readlines(chomp: true).map { |l| ".#{l}." }

    n = s.length
    s.prepend '.' * (n + 2)
    s.append  '.' * (n + 2)

    nums = s.map { |line| line.gsub(/.(\d+)/).map { [Regexp.last_match(1).to_i, Range.new(*Regexp.last_match.offset(0))] } }

    ans = 1.upto(n).sum do |i|
      s[i].gsub(/\*/).sum do
        gear_index = Regexp.last_match.begin(0)
        adjacent_parts = nums[(i - 1)..(i + 1)].flat_map { |p| p.select { |_, r| r.cover?(gear_index) } }.map(&:first)
        adjacent_parts.length == 2 ? adjacent_parts.inject(&:*) : 0
      end
    end

    puts ans
  end
end