#unit tests for the Task model
require "rails_helper"

RSpec.describe Task, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      task = Task.new(descritpion: "Content of the description")
      expect(task.valid?).to eq(false)
    end

    it "ensures the description is present" do
      task = Task.new(title: "Title")
      expect(task.valid?).to eq(false)
    end
    
    it "should be able to save task" do
      task = Task.new(title: "Title", descritpion: "Some description content goes here")
      expect(task.save).to eq(true)
    end
  end

  context "scopes tests" do
    let(:params) { { title: "Title", descritpion: "some description" } }
    before(:each) do
      Task.create(params)
      Task.create(params)
      Task.create(params)
    end

    it "should return all projects" do
      expect(Task.count).to eq(3)
    end

  end
end
