class Image

  def initialize(pic)
    @pic = pic
  end

  def output_pic
    @pic.each do |pix|
      puts pix.join
    end
  end

  def get_ones
    ones = []
    @pic.each_with_index do |row, row_number|
      row.each_with_index do |num, col_number|
        if num == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur
    ones = get_ones
    @pic.each_with_index do |row, row_number|
      row.each_with_index do |num, col_number|
        puts "Array, number:"
        puts "#{row},#{num}"
        puts "coordinates:"
        puts "#{row_number},#{col_number}"
        
        ones.each do |found_row_number, found_col_number|
          puts "one:"
          puts "#{found_row_number},#{found_col_number}"

          if row_number == found_row_number && col_number == found_col_number
            @pic[row_number -1][col_number] = 1 unless row_number == 0 #up
            @pic[row_number +1][col_number] = 1 unless row_number >= 3 #down
            @pic[row_number][col_number -1] = 1 unless col_number == 0 #left
            @pic[row_number][col_number +1] = 1 unless col_number >= 3 #right

          end
        end
      end
    end

  end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_pic
image.blur
puts
puts "Blurs into:"
image.output_pic
