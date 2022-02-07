require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_001)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    assert_not @user.valid?
  end

  test 'invalid with number in the name' do
    @user.name = '11111'
    assert_not @user.valid?
  end

  test 'invalid without username' do
    @user.username = nil
    assert_not @user.valid?
  end

  test 'invalid with less than 6 characters in the username' do
    @user.username = 'johnl'
    assert_not @user.valid?
  end

  test 'invalid with more than 20 characters in the username' do
    @user.username = 'john.lennon12345678912345'
    assert_not @user.valid?
  end

  # test 'invalid with special characters in the username' do
  #   @user.username = '***john.lennon'
  #   assert_not @user.valid?
  # end

  test 'invalid with spaces in the username' do
    @user.username = 'john lennon'
    assert_not @user.valid?
  end

  test 'invalid without password' do
    @user.password = ''
    assert_not @user.valid?
  end

  test 'invalid with less than 6 characters in the password' do
    @user.password = '12345'
    assert_not @user.valid?
  end

  # test 'invalid with numbers in the name' do
  #   @user.name = 'J0hn Lennon'
  #   assert_not @user.valid?
  # end

  # test 'invalid with characters in the name' do
  #   @user.name = 'John Lenn@n'
  #   assert_not @user.valid?
  # end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid user with a same email' do
    user1 = User.new(email: 'test@sample.com', name: 'John Lennon', username: 'johnlennon', password: '12345678')
    assert_not user1.save, "Saved the user with the same email"
  end

  test 'invalid user with a same username' do
    user1 = User.new(email: 'johnlennon@sample.com', name: 'John Lennon', username: 'test123', password: '12345678')
    assert_not user1.save, "Saved the user with the same username"
  end
end
