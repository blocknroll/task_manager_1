require_relative '../test_helper'

class FrontPageTest < FeatureTest

  def test_user_sees_greeting
    visit '/'
    assert page.has_content?("Manage Your Tasks.")
  end

  def test_user_sees_greeting_on_front_page
    visit '/'
    within('#greeting') do
      assert page.has_content?("Manage Your Tasks.")
    end
  end

  def test_user_sees_index_and_new_links
    visit '/'
    within ('.nav') do
      assert page.has_link?('ALL TASKS')
      assert page.has_link?('NEW TASK')
    end
  end
end
