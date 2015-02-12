require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid email signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "naga",
                             email: "niggasIn@pa",
                          password: "asdfdsa",
             password_confirmation: "afafaa"}
    end
    assert_template 'users/new'
  end

  test "valid email signup" do
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Jeffery Smith",
                                           email: "jsmith@example.com",
                                           password:"foobarski",
                                           password_confirmation: "foobarski"}
    end
    assert_template 'users/show'
  end
end
