class Image
 attr_accessor :picture
 
    def initialize(picture)
      @picture = picture
    end

    def find_ones
      found_ones = []
      @picture.each_with_index do |row, row_number|
        row.each_with_index do |number, col_number|
          if number == 1
            found_ones << [row_number, col_number]
          end
        end
      end
      found_ones
    end

    def blur(distance)
      found_ones = find_ones
      @picture.each_with_index do |row, row_number|
        row.each_with_index do |number, col_number|
          found_ones.each do | found_row, found_column|
            if manhattan_distance(col_number, row_number, found_column, found_row) <= distance
              @picture[row_number][col_number] =1
            end
          end
        end
      end
    end
     
     def manhattan_distance(x1, y1, x2, y2)
      horizontal_distance = (x2 - x1).abs
      vertical_distance = (y2 -y1).abs
      horizontal_distance + vertical_distance
     end         

              
 
    def output_image
        @picture.each do |num|
        puts num.join
        end
    end   
end

   


    

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0,],
  [0, 0, 0, 0,]
])
#image.output_image

image.blur(2)
image.output_image
