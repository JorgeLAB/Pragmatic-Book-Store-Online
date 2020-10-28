require 'rails_helper'

RSpec.describe Product, type: :model do
	it "Cadastrando um novo produto" do
		produto = Product.new
		expect(produto).to be_present
	end

end
