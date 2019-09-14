class Image

  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each do |pixels|
      puts pixels.join
    end
  end

  def get_ones
    ones = []
      @pixels.each_with_index do |row, row_num|
        row.each_with_index do |item, col_num|
          if item == 1
            ones << [row_num, col_num]
          end
        end
      end
    ones
  end

  def blur
    ones = get_ones
      @pixels.each_with_index do |row, row_num|
        row.each_with_index do |item, col_num|
          ones.each do |ones_row, ones_col|
            if row_num == ones_row && col_num == ones_col
              @pixels[row_num -1][col_num] = 1 unless row_num == 0 #up
              @pixels[row_num +1][col_num] = 1 unless row_num >= 10 #up
              @pixels[row_num][col_num -1] = 1 unless col_num == 0 #up
              @pixels[row_num][col_num +1] = 1 unless col_num >= 10 #up
            end
          end
        end
      end
  end

  def manhattan
    puts "Enter your Manhattan distance:"
    @manhattan = gets.to_i
    puts "You entered #{@manhattan} as your Manhattan number."
      output_image
      puts
      puts "Blurs into:"
    @manhattan.times do
      blur
    end
  end

end

image = Image.new([
  [1,0,0,0,0,0,0,0,0,0,1],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0],
  [1,0,0,0,0,0,0,0,0,0,1],
])


image.manhattan
image.output_image