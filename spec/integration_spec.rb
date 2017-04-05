require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a viewing new list', {:type => :feature}) do
    it('allows a user to add/view a list to see the tasks and details for it') do
      visit('/')
      fill_in('name', :with =>'Moringaschool Work')
      click_button('Add New List')
      expect(page).to have_content('Moringaschool Work')
    end
  end

  describe('seeing details for a single list', {:type => :feature}) do
    it('allows a user to click a list to see the tasks and details for it') do
      test_list = List.new({:name => 'School stuff', :id => nil})
      test_list.save()
      test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
      test_task.save()
      visit('/')
      click_link(test_list.name())
      expect(page).to have_content(test_task.description())
    end
  end

  describe('adding tasks to a list', {:type => :feature}) do
    it('allows a user to add a task to a list') do
      test_list = List.new({:name => 'School stuff', :id => nil})
      test_list.save()
      visit("/")
      select('School stuff', {:from => 'Select a List'})
      fill_in("description", {:with => "Learn SQL"})
      click_button("Add task")
      expect(page).to have_content("Learn SQL")
    end
  end
