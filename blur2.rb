
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

    def blur
      found_ones = find_ones
      @picture.each_with_index do |row, row_number|
        row.each_with_index do |number, col_number|
          found_ones.each do | found_row, found_column|
            if row_number == found_row && col_number == found_column
              @picture[row_number - 1][col_number] = 1 unless row_number == 0
              @picture[row_number + 1][col_number] = 1 unless row_number >= 3
              @picture[row_number][col_number - 1] = 1 unless col_number == 0
              @picture[row_number][col_number + 1] =1 unless col_number >= 3
            end
          end
        end
      end
    end
              

              
 
    def output_image
        @picture.each do |num|
        puts num.join
        end
    end   
end

   


    

image = Image.new([
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
#image.output_image

image.blur
image.output_image
