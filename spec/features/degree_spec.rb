require 'rails_helper'

RSpec.feature "Degrees", type: :feature do
  describe "teachers/:teacher_id/degrees" do
    it "can see a list of degrees"
    it "can delete a degree"
  end

  describe "teachers/:teacher_id/degrees/new" do
    context "when I visit the degree's new page" do
      it "can add a new degree"
    end
  end

  describe "teachers/:teacher_id/degrees/:id" do
    context "when I visit the degree's show page" do
      it "see the degree's details"
    end
  end

  describe "teachers/:teacher_id/degrees/:id/edit" do
    context "when I visit the degree's edit page" do
      it "can edit the degree"
    end
  end
end