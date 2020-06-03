require 'test_helper'
# como não coloquei nenhum objeto para teste ele irá testar com o que há
#no products.yml, e para eu testar o tenho de fazer bin/rails test:controllers

# LEMBRANDO - bin/rails test:controllers 
class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select '#columns #side a', mininum: 4
    assert_select '#main, entry', 3 # não entendi o 3 agora eu entendi tem haver 3 casos deem match
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$\s[,\d]+\.\d\d/
  end

end
