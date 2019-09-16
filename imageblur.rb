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

  def blur_helper 
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
  		@image[location[0]][location[1] - 1] = 1 if location[1] - 1 >= 0
  		@image[location[0] + 1][location[1]] = 1 if location[0] + 1 <= @image.length - 1
  		@image[location[0] - 1][location[1]] = 1 if location[0] - 1 >= 0
  	end
  end

  def blur (dis)
    dis.times do
      blur_helper
    end
  end

  # def distance (x1, y1, x2, y2)
  #   horizontal_distance = (x2 - x1).abs
  #   vertical_distance = (y2 - y1).abs
  #   horizontal_distance + vertical_distance
  # end


end
image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.blur(2)
image.output_image

