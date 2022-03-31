
require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_task_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    
    # scenario "should be successful" do
    #   fill_in "Descritpion", with: "Test descritpion"
    #   click_button "Create Task"
    #   expect(page).to have_content("Task was successfully created")
    # end
    

    scenario "should fail" do
      click_button "Create Task"
      expect(page).to have_content("Descritpion can't be blank")
    end
  end

  context "Update project" do
    let(:task) { Task.create(title: "Test title", descritpion: "Test content") }
    before(:each) do
      visit edit_task_path(task)
    end

    # scenario "should be successful" do
    #   within("form") do
    #     fill_in "Descritpion", with: "New description content"
    #   end
    #   click_button "Update Task"
    #   expect(page).to have_content("Task was successfully updated")
    # end

    # scenario "should fail" do
    #   within("form") do
    #     fill_in "Descritpion", with: ""
    #   end
    #   click_button "Update Task"
    #   expect(page).to have_content("Descritpion can't be blank")
    # end
  end

  context "Remove existing project" do
    let!(:task) { Task.create(title: "Test title", descritpion: "Test content") }
    scenario "remove task" do
      visit tasks_path
      click_link "Destroy"
      expect(page).to have_content("Task was successfully destroyed")
      expect(Task.count).to eq(0)
    end
  end
end
