# require("rspec")
#   require("pg")
#   require("task")
#
#   DB = PG.connect({:dbname => 'to_do_test'})
#
#   RSpec.configure do |config|
#     config.after(:each) do
#       DB.exec("DELETE FROM tasks *;")
#     end
#   end
require("spec_helper")

  describe Task do
    describe("#description") do
       it("lets you read the description out") do
         test_task = Task.new({:description => "learn SQL", :list_id => 1})
         expect(test_task.description()).to(eq("learn SQL"))
       end
     end

    describe("#==") do
      it("is the same task if it has the same description") do
        task1 = Task.new({:description => "learn SQL", :list_id => 1})
        task2 = Task.new({:description => "learn SQL", :list_id => 1})
        expect(task1).to(eq(task2))
      end
    end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
end
