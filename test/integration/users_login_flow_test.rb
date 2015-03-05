require 'test_helper'

class UsersLoginFlowTest < ActionDispatch::IntegrationTest

  test "User login process" do
    # get '/' resource
    visit(root_path)

    # assert is redirected to login page.
    assert current_path == new_user_session_path

    # fill all fields in login form.
    fill_in('user_email', with: 'pperez@uninorte.edu.co')
    fill_in('user_password', with: '1234')
    click_on('Log in')

    # Index page
    page.has_content?('Tasks')
  end
end