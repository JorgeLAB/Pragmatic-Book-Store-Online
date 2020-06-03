require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products
  # Aqui nós estamos descrevendo alguns casos de erro
	test "product attributes must not be empty" do
	  	product = Product.new( title: 'My Book', description: 'Hello man', image_url: 'aspiradorred.jpg')
	  	product.price = -1
	  	assert product.invalid?
	  	assert_equal ['must be greater than or equal to 0.01'],
	  		product.errors[:price]

	  	product.price = 0
	  	assert product.invalid?
	  	assert_equal ["must be greater than or equal to 0.01"],
	  		product.errors[:price]

	  	product.price = 1
	  	assert product.valid? 
	end
	def new_product(image_url)
		Product.new( title: "My book title", description:"testando", price: 1, image_url: image_url)
	end

	test "image_url" do 
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.JPG FRED.Jpg httep://a.b.c/x/y/z/fred.gif}

		bad = %w{ fred.doc fred.gif/more fred.git.more }

		ok.each do |name|
			assert new_product(name).valid?, "#{name} shouldn't be invalid"
		end

		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end
	end

	test "product is not valid without a unique title" do
		product = Product.new( title: products(:one).title, description: "yyy", price: 1, image_url: "fred.git" )
		assert product.invalid?
		assert_equal ['has already been taken'], product.errors[:title]
	end
end

