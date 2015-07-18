class TestController < ApplicationController
  acts_as_token_authentication_handler_for Organization
  def test
    
  end
end
