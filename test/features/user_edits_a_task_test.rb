require_relative '../test_helper'

class UserEditsTaskTest < FeatureTest

  def test_user_edits_a_task

    TaskManager.create({:title => "original title",
                        :description => "original description"} )

    visit '/tasks/1/edit'

    fill_in 'task[title]', with: "updated title"
    fill_in 'task[description]', with: 'updated description'
    click_link_or_button("update task!")

    assert_equal '/tasks/1', current_path

    within('#title') do
      assert page.has_content?("updated title")
    end
    within('#description') do
      assert page.has_content?("updated description")
    end
  end



  def test_user_deletes_a_task
    TaskManager.create({:title => "original title",
                        :description => "original description"} )
    visit '/tasks'
    assert page.has_content?("original title")
    click_link_or_button('delete')
    assert_equal '/tasks', current_path
    refute page.has_content?("original title")
  end

end
