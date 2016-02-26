require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @task = @user.tasks.build(title: "レジュメ作成")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
  
  test "title should be present" do
    @task.title=" "
    assert_not @task.valid?
  end
  
  test "title should be at most 50 characters" do
    @task.title="a"*51
    assert_not @task.valid?
  end
  
  test "content should be at most 50 characters" do
    @task.content="a"*501
    assert_not @task.valid?
  end
  
  test "order should be most urgent first" do
    assert_equal tasks(:most_urgent), Task.first
  end
  
  test "associated tasks should be destroyed" do
    @user.save
    @user.tasks.create!(title: "Lorem ipsum")
    assert_difference 'Task.count', -1 do
      @user.destroy
    end
  end
  
end
