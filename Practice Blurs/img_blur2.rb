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
    @pixels.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end


  def blur
    ones = get_ones
    # puts ones
      @pixels.each_with_index do |row, row_number|
        row.each_with_index do |item, col_number|
          # puts "#{row_number},#{col_number}"
          # puts "#{row},#{item}"

          ones.each do |found_row_number, found_col_number|
            # puts "#{found_row_number},#{found_col_number}"
          
            if row_number == found_row_number && col_number == found_col_number
              @pixels[row_number -1][col_number] = 1 unless row_number == 0 #up
              @pixels[row_number +1][col_number] = 1 unless row_number >= 3 #down
              @pixels[row_number][col_number -1] = 1 unless col_number == 0 #left
              @pixels[row_number][col_number +1] = 1 unless col_number >= 3 #right
            end
          end
        end
      end
  end

end


image = Image.new([
     # row      row number      col_number
 #item
  [0, 0, 0, 0],   #(0,          (0,1,2,3))
  [0, 1, 0, 0],   #(1,          (0,1,2,3))
  [0, 0, 0, 1],   #(2,          (0,1,2,3))
  [0, 0, 0, 0]    #(3,          (0,1,2,3))
])

image.output_image
image.blur
puts
puts "Blurs into:"
image.output_image