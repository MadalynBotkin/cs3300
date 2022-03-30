#require 'rails_helper'

#RSpec.feature "Tasks", type: :feature do
#  pending "add some scenarios (or delete) #{__FILE__}"
#end


require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_task_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    #Project changed to Task, description spelling changed
    scenario "should be successful" do
      fill_in "Descritpion", with: "Test descritpion"
      click_button "Create Task"
      expect(page).to have_content("Project was successfully created")
    end

    #Project changed to Task
    scenario "should fail" do
      click_button "Create Task"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:task) { Task.create(title: "Test title", descritpion: "Test content") }
    before(:each) do
      visit edit_task_path(task)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:task) { Task.create(title: "Test title", descritpion: "Test content") }
    scenario "remove project" do
      visit task_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Task.count).to eq(0)
    end
  end
end
