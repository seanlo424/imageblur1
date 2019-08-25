class Image
	attr_accessor :image

	def initialize (image)
		@image = image
	end

	def output_image
		@image.each do |row|
			puts row.join
    end
  end

  def blur 
  	bright_pixels = []
  	@image.each_with_index do |row, row_index|
  		row.each_with_index do |pixel, pixel_index| 
  			if pixel == 1
  				bright_pixels.push([row_index, pixel_index])
				end
			end
  	end

  	bright_pixels.each do |location|
  		@image[location[0]][location[1] + 1] = 1 if location[1] + 1 <= @image[location[0]].length - 1
  		@image[location[0]][location[1] - 1] = 1 if location[1 - 1 >= 0]
  		@image[location[0] + 1][location[1]] = 1 if location[0] + 1 <= @image.length - 1
  		@image[location[0] - 1][location[1]] = 1 if location[0] - 1 >= 0
  	end


  end
end
image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])
image.bright_pixels!(2)
image.output_image

