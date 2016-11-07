require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = create(:person)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    @new_person = build(:person2)
    assert_difference('Person.count') do
      post :create, person: { bio: @new_person.bio, birthdate: @new_person.birthdate, email: @new_person.email, first_name: @new_person.first_name, gender: @new_person.gender, job: @new_person.job, last_name: @new_person.last_name, picture: @new_person.picture }
    end
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { bio: @person.bio, birthdate: @person.birthdate, email: @person.email, first_name: @person.first_name, gender: @person.gender, job: @person.job, last_name: @person.last_name, picture: @person.picture }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
