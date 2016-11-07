require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  def setup
    @person = build(:person)
  end

  test "should be a valid user" do
    assert @person.valid?
  end

  test 'invalid without first name' do
    @person.first_name = nil
    refute @person.valid?, 'saved user without first name'
    assert_not_nil @person.errors[:name], 'no validation error for name present'
  end

  test 'invalid without last name' do
    @person.last_name = nil
    refute @person.valid?, 'saved user without last name'
    assert_not_nil @person.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @person.email = nil
    refute @person.valid?
    assert_not_nil @person.errors[:email]
  end

  test 'invalid without birthdate' do
    @person.birthdate = nil
    refute @person.valid?
    assert_not_nil @person.errors[:birthdate]
  end

end
