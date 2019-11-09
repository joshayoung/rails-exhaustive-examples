require 'rails_helper'

RSpec.feature "Klasses", type: :feature do
  describe "teachers/:teacher_id/klasses" do
    it "can see a list of classes"
    # TODO: Remove this to the bottom? - CRUD:
    it "can remove a class"
  end

  describe "teachers/:teacher_id/klasses/new" do
    context "when I visit the class's new page" do
      it "can add a new class"
    end
  end

  describe "teachers/:teacher_id/degrees/:id" do
    context "when I visit the class's show page" do
      it "see the class's details"
    end
  end

  describe "teachers/:teacher_id/klasses/:id/edit" do
    context "when I visit the class' edit page" do
      it "can edit the class"
    end
  end
end
