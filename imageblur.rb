class Image
	attr_accessor :row


def initialize (row)
	@row = row
end

def output_image
	@row.each do |row|
		puts row.join
	end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])
image.output_image

end