class Image
 attr_accessor :smile
 
    def initialize(smile)
    @smile = smile
    end
 
    def output_image
        @smile.each do |num|
        puts num.join
    end 

 end   
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image