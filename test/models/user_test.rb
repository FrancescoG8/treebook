require 'test_helper'

#assertion that user will not be saved in file
#tests that user enters first name
#assert that errors on first name field are not empty

class UserTest < ActiveSupport::TestCase

  test "a user should enter a first name" do
    user = User.new
    assert ! user.save
  	assert ! user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert ! user.save
  	assert ! user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert ! user.save
  	assert ! user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:francesco).profile_name

    assert ! user.save
  	assert ! user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "My Profile With Spaces"

  	assert ! user.save
  	assert ! user.errors[:profile_name].empty
  	assert ! user.errors[:profile_name].include?("Must be formatted correctly.")
  end
end