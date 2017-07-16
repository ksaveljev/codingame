@n = gets.to_i
@c = gets.to_i
@b = []
@n.times do
    @b << gets.to_i
end

@b.sort!
@result = []
@s = @b.inject(:+)

if @s < @c then
  puts "IMPOSSIBLE"
else
  @b.each { |v|
    @m = @c / @n
    if v < @m then
      @result << v
      @c = @c - v
    else
      @result << @m
      @c = @c - @m
    end
    @n = @n - 1
  }

  @result.sort!.each { |v| puts v }
end

