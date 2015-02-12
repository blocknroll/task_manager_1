require_relative '../test_helper'

class UserCreatesTaskTest < FeatureTest

  def test_user_creates_a_task
    visit '/'
    click_link_or_button('NEW TASK')
    assert_equal '/tasks/new', current_path
    fill_in 'task[title]', with: "Eat ice cream"
    fill_in 'task[description]', with: 'yum'
    click_link_or_button("Make a task!")
    assert_equal '/tasks', current_path
    within('.task_panel') do
      assert page.has_content?("Eat ice cream")
    end
  end

  def test_user_edits_a_task
    TaskManager.create({:title => "updated title"
                        :description => "updated description"

      })

    visit '/tasks'
    click_link_or_button('NEW TASK')
    assert_equal '/tasks/new', current_path
    fill_in 'task[title]', with: "Eat ice cream"
    fill_in 'task[description]', with: 'yum'
    click_link_or_button("Make a task!")
    assert_equal '/tasks', current_path
    within('.task_panel') do
      assert page.has_content?("Eat ice cream")
    end
  end

end
